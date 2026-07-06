# postgresql-ecommerce-data-warehouse
End-to-end PostgreSQL Data Warehouse project implementing Staging, OLTP, Star Schema, ETL, Data Quality Validation, Performance Optimization, and BI reporting.

## 📌 1. Project Overview

Try to demonstrate the building a PostgreSQL-based Data Warehouse using the Brazilian Olist E-Commerce dataset.

The project follows tandard ETL architecture by transforming raw CSV files into a structured analytical database through multiple layers:

- Staging Layer
- OLTP Layer
- Data Warehouse Layer
- (Upcoming) Data Mart Layer

The implementation focuses not only on SQL development but also on database administration, data validation, performance optimization, and reporting preparation.

---

## 🎯 2. Project Objectives

It covers the complete ETL workflow from raw data ingestion to an analytical data warehouse using PostgreSQL.

---

## 🏗️ 3. Project Architecture

```
                     CSV Files
                          │
                          ▼
                 Staging Schema
                 (Raw Data Layer)
                          │
                          ▼
                 OLTP Schema
           (Normalized Database)
                          │
                          ▼
              Data Warehouse
              (Star Schema)
                          │
                          ▼
             Data Mart Layer
                (Upcoming)
                          │
                          ▼
              Power BI Dashboard
                (Upcoming)
```

---

## 🛠️ 4. Technology Stack

| Category | Technology |
|----------|------------|
| Database | PostgreSQL 18 |
| Database Tool | pgAdmin 4 |
| Version Control | Git |
| Repository | GitHub |
| Dataset | Olist Brazilian E-Commerce |
| SQL | PostgreSQL SQL |
| Documentation | Markdown |
| BI Tool | Power BI *(Upcoming)* |

---

## 📂 5. Dataset

Dataset Source

**Olist Brazilian E-Commerce Public Dataset**

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### Files Used

- olist_customers_dataset.csv
- olist_orders_dataset.csv
- olist_order_items_dataset.csv
- olist_order_payments_dataset.csv
- olist_order_reviews_dataset.csv
- olist_products_dataset.csv
- olist_sellers_dataset.csv
- product_category_name_translation.csv
- olist_geolocation_dataset.csv

---

## 🔄 6. ETL Pipeline

```
CSV Files
      │
      ▼
Staging Schema
      │
      ▼
Data Cleaning
      │
      ▼
Data Validation
      │
      ▼
OLTP Schema
      │
      ▼
Warehouse Schema
      │
      ▼
Data Mart (Upcoming)
      │
      ▼
Power BI Dashboard (Upcoming)
```

---

# 📚 7. Layer Description

## 1️⃣ Staging Layer

Purpose

- Landing area for raw CSV files
- Preserves source data
- Performs initial validation
- Supports repeatable ETL processes

Objects

- staging.stg_customers
- staging.stg_orders
- staging.stg_order_items
- staging.stg_order_payments
- staging.stg_order_reviews
- staging.stg_products
- staging.stg_sellers
- staging.stg_geolocation
- staging.stg_category_translation

---

## 2️⃣ OLTP Layer

Purpose

Creates a normalized operational database using primary and foreign key relationships.

Features

- Primary Keys
- Foreign Keys
- Referential Integrity
- Normalized Schema
- Data Consistency

Core Tables

- customers
- orders
- order_items
- products
- sellers
- order_payments
- order_reviews

---

## 3️⃣ Warehouse Layer

Purpose

Transforms normalized OLTP tables into a Star Schema optimized for reporting and analytics.

Dimension Tables

- dim_customer
- dim_product
- dim_seller
- dim_date

Fact Tables

- fact_sales

Features

- Star Schema
- Surrogate Keys
- Analytical Queries
- Reporting Optimization

---

## 4️⃣ Data Mart Layer *(Upcoming)*

Purpose

Provide subject-oriented datasets for business reporting.

Planned Data Marts

- Sales Mart
- Customer Mart
- Product Mart
- Seller Performance Mart

---

# 📊 Database Design

### Staging

Raw landing tables.

### OLTP

Normalized transactional database.

### Warehouse

Star Schema with dimensions and fact tables.

---

# 🚀 Current Project Status

| Module | Status |
|---------|--------|
| Database Creation | ✅ |
| Staging Layer | ✅ |
| Data Profiling | ✅ |
| OLTP Schema | ✅ |
| Warehouse Schema | ✅ |
| Dimension Loading | ✅ |
| Fact Loading | ✅ |
| Data Validation | 🚧 |
| Stored Procedures | ⏳ |
| Triggers | ⏳ |
| Views | ⏳ |
| Materialized Views | ⏳ |
| Partitioning | ⏳ |
| Performance Monitoring | ⏳ |
| Backup & Restore | ⏳ |
| Data Marts | ⏳ |
| Power BI Dashboard | ⏳ |

---

# 📈 Future Enhancements

- Stored Procedures
- ETL Logging
- Trigger-based Auditing
- Views
- Materialized Views
- Query Optimization
- Table Partitioning
- Backup & Restore
- Performance Monitoring
- Data Mart Design
- Power BI Dashboard

---

# 👨‍💻 Author

**Gowri R**

Aspiring Data Engineer | PostgreSQL DBA | SQL Developer

LinkedIn: *(www.linkedin.com/in/gowri-ramakrishnanr)*
