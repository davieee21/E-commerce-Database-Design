# E-commerce-Database-Design
Peer Group Assignment: E-commerce Database Design


# 📦 E-commerce Database Project

## 🧠 Project Overview
This project is a **relational database schema** designed for a basic **e-commerce platform**.  
It focuses on setting up a scalable and well-structured database to handle products, brands, categories, sizes, colors, attributes, and variations — providing a strong foundation for any online shopping application.

Our goal was to:
- **Create a clean Entity-Relationship Diagram (ERD)** and reflect it precisely in the database.
- **Design normalized tables** that avoid redundancy and ensure data integrity.
- **Document everything carefully** for easy understanding and future scaling.

---

## 🏗️ Database Structure

The database consists of **12 interconnected tables**, each serving a specific role:

| Table Name            | Purpose                                                                                  |
|------------------------|------------------------------------------------------------------------------------------|
| `brand`                | Stores information about product brands.                                                 |
| `product_category`     | Categorizes products (e.g., clothing, electronics).                                       |
| `color`                | Manages available color options for product variations.                                  |
| `size_category`        | Groups sizes into categories (e.g., clothing sizes, shoe sizes).                         |
| `size_option`          | Defines specific size options (e.g., S, M, L, 42).                                        |
| `product`              | Stores general product details like name, brand, base price, and category.               |
| `product_image`        | Stores URLs or references to images of products.                                          |
| `product_variation`    | Represents specific variations of products by color and/or size.                         |
| `product_item`         | Represents the actual stock-keeping units (SKU) available for sale with price and stock. |
| `attribute_category`   | Groups custom attributes (e.g., "Physical", "Technical").                                 |
| `attribute_type`       | Defines the data type for attributes (e.g., text, number, boolean).                       |
| `product_attribute`    | Stores custom attributes tied to each product (e.g., weight, material).                  |

---

## 🧩 Data Flow Explained

Here’s how data flows between entities:

1. **Products** are created with a **Brand** and a **Product Category**.
2. Each **Product** can have multiple **Images**.
3. A **Product** can have multiple **Variations**:
   - A Variation can have an optional **Color** and **Size**.
4. Each **Variation** can be sold as one or more **Product Items** with:
   - A unique SKU
   - A sale price
   - Available stock quantity
5. Each **Product** can also have multiple **Attributes**:
   - These are classified by **Attribute Categories** and described using **Attribute Types** (e.g., numeric, text).

Thus, the schema **separates general product data from variation-specific and attribute-specific data**, making the system highly flexible for different product types.

---

## 🎨 Why This Design?

- **Scalability:** New brands, categories, attributes, or variations can be added easily without touching existing tables.
- **Flexibility:** Products without size or color (e.g., books) are still supported.
- **Data Integrity:** Foreign keys, ON DELETE CASCADE, and other constraints maintain strong relational integrity.
- **Realism:** Mirrors how real-world e-commerce systems (like Shopify, Amazon) structure backend data.

---

## 📂 Files in This Repository

| File Name            | Description                                                                |
|----------------------|----------------------------------------------------------------------------|
| `ecommerce.sql`       | Full SQL script that creates all tables, relationships, and constraints.  |
| `ERD.png` (optional)  | Entity-Relationship Diagram showing the database structure visually.      |
| `README.md`           | This documentation explaining the database design and decisions.         |

---

## 🛠️ How to Use

1. Install MySQL Server (or use any database management tool like MySQL Workbench).
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-database.git
   ```
3. Open your SQL client and run:
   ```sql
   SOURCE path/to/ecommerce.sql;
   ```
4. Your database will be ready to use!

---

## 👥 Team Collaboration Notes

- We collaborated actively by discussing table structures, relationships, and business logic.
- We used version control (GitHub) to track changes and update the project.
- Each team member was responsible for understanding every part of the database design.

---

## 🚀 Future Improvements (optional ideas)

- Add tables for **users**, **orders**, and **payment transactions**.
- Implement stored procedures for inventory updates.
- Create views for simplified product listings.
- Add triggers for automatic stock management.

---

# ✅ Conclusion

This e-commerce database schema is clean, scalable, and production-ready for any beginner or intermediate online store project.  
We focused heavily on real-world application, best practices, and clarity in design.

---

# 📬 Contact

Feel free to reach out if you have any questions or feedback!  
_Contributors:_ Davis Ongeri

---

# 📸 Screenshot

_(Insert ERD screenshot image if available.)_

---

# ✨ End of README ✨

---
