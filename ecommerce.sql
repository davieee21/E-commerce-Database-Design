-- ========================================
-- 🛒 E-commerce Database Schema
-- Author: Davis Ongeri
-- Description: Full schema for a simple e-commerce platform
-- ========================================

-- 🚀 SAFETY: Drop existing tables to avoid conflicts when recreating
DROP TABLE IF EXISTS 
    product_attribute, 
    attribute_category, 
    attribute_type, 
    product_image, 
    product_item, 
    product_variation, 
    product, 
    brand, 
    product_category, 
    color, 
    size_option, 
    size_category;

-- ========================================
-- 📦 Table: brand
-- Stores brand-related data
-- ========================================
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- ========================================
-- 📦 Table: product_category
-- Classifies products into categories (e.g., clothing, electronics)
-- ========================================
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- ========================================
-- 🎨 Table: color
-- Manages available color options
-- ========================================
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    hex_value CHAR(7) -- e.g., '#FFFFFF'
);

-- ========================================
-- 📏 Table: size_category
-- Groups sizes into categories (e.g., clothing sizes, shoe sizes)
-- ========================================
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ========================================
-- 📐 Table: size_option
-- Lists specific size options (e.g., S, M, L, 42)
-- ========================================
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- 📦 Table: product
-- Stores general product details
-- ========================================
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL, -- e.g., 9999.99
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES product_category(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- 🖼️ Table: product_image
-- Stores product image URLs or file references
-- ========================================
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- 🔄 Table: product_variation
-- Links a product to its variations (e.g., size, color)
-- ========================================
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    -- Variations are optional. Some products may not have colors or sizes.
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (color_id) REFERENCES color(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ========================================
-- 🧾 Table: product_item
-- Represents purchasable items with specific variations
-- ========================================
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    variation_id INT,
    sku VARCHAR(100) NOT NULL UNIQUE, -- Stock Keeping Unit
    price DECIMAL(10,2) NOT NULL, -- allows overriding base price if needed
    stock_quantity INT DEFAULT 0, -- optional: inventory management
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ========================================
-- 📚 Table: attribute_category
-- Groups attributes into categories (e.g., physical, technical)
-- ========================================
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- ========================================
-- 🧪 Table: attribute_type
-- Defines types of attributes (e.g., text, number, boolean)
-- ========================================
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE -- Examples: "Text", "Number", "Boolean"
);

-- ========================================
-- 🧵 Table: product_attribute
-- Stores custom attributes for products
-- ========================================
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    name VARCHAR(255) NOT NULL, -- e.g., "Material", "Weight"
    value VARCHAR(500) NOT NULL, -- e.g., "Cotton", "1.2 kg"
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ========================================
-- ✅ DATABASE CREATION COMPLETE
-- ========================================
