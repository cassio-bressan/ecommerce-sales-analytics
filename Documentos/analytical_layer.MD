# Analytical Layer

## Purpose

The analytical layer was created to centralize and standardize the data required
for business analysis and dashboard development.

Instead of repeatedly joining multiple transactional tables in every SQL query,
this layer provides a single analytical view containing the most relevant sales,
product and customer information.

The analytical layer serves as the primary data source for business analyses and
the executive dashboard developed in this project.

---

## Business Context

During Sprint 3, every business question required multiple joins between the
transactional tables.

For example, analyses such as Revenue by Category, Top Products and Revenue by
Country depended on joining:

- order_items
- products
- users

Although technically correct, this approach resulted in repetitive SQL,
duplicated business logic and increased maintenance effort.

To solve this problem, an analytical view was introduced during Sprint 4.

The analytical view encapsulates the joins and exposes a business-oriented data
model that can be reused across multiple analyses.

---

## Architecture

```
                   +------------------+
                   |      Users       |
                   +------------------+
                           |
                           |
                           |
+------------------+       |       +------------------+
|    Products      |-------+-------|   Order Items    |
+------------------+               +------------------+
               \                       /
                \                     /
                 \                   /
                  \                 /
                   +---------------+
                   |   vw_sales    |
                   +---------------+
                           |
                           |
           +---------------+---------------+
           |                               |
           |                               |
 Business Analyses                Executive Dashboard
```

---

## Source Tables

The analytical layer consolidates information from the following transactional
tables:

### order_items

Fact table containing one record per sold item.

Main attributes used:

- order_id
- user_id
- product_id
- sale_price
- status
- created_at

---

### products

Product dimension used to enrich sales information.

Main attributes used:

- product_name
- category
- department

---

### users

Customer dimension used to enrich sales with customer and geographical
information.

Main attributes used:

- customer_name
- gender
- age
- country
- state
- city

---

## Analytical View

The analytical layer is implemented as a BigQuery View.

View name:

```
analytics.vw_sales
```

The view consolidates all required business attributes into a single reusable
dataset.

### Available Attributes

#### Identifiers

- order_id
- user_id
- product_id

#### Sales Information

- sale_price
- status
- order_created_at

#### Time Dimensions

- order_year
- order_month
- order_year_month

#### Product Information

- product_name
- category
- department

#### Customer Information

- customer_name
- gender
- age

#### Geographic Information

- country
- state
- city

---

## Business Rules

The analytical view follows the following design principles:

- No status filtering is applied.
- All orders are preserved.
- Customer first and last names are standardized into a single field.
- Time dimensions are precomputed for dashboard consumption.
- Product and customer dimensions are already joined.
- The view represents the single source of truth for sales analyses.

Business filters (such as considering only completed sales) are intentionally
applied within each analytical query rather than inside the view itself.

This design allows the same analytical layer to support different business
scenarios.

---

## Supported Business Analyses

The analytical view is used as the primary data source for the following
analyses:

- Executive Sales Overview
- Monthly Revenue Trend
- Top Categories by Revenue
- Revenue by Department
- Top Products by Revenue
- Top Customers by Revenue
- Revenue by Country
- Average Order Value by Country

---

## Operational Analyses

Not every analysis should consume the analytical layer.

The following analyses intentionally use the transactional **orders** table:

- Order Status Distribution
- Monthly Orders Trend

These analyses focus on operational order lifecycle metrics rather than sales
analytics.

Using the transactional table avoids unnecessary abstraction and better
represents the business process being analyzed.

---

## Benefits

The analytical layer provides several advantages:

- Single source of truth for sales analysis.
- Elimination of repetitive JOIN operations.
- Simpler and more readable SQL queries.
- Centralized business logic.
- Easier maintenance.
- Reduced code duplication.
- Improved dashboard performance and development.
- Consistent data model across all business analyses.

---

## Conclusion

The implementation of the analytical layer represents an important architectural
improvement in the project.

Instead of querying multiple transactional tables directly, business analyses
now consume a standardized analytical view designed specifically for reporting
and dashboarding.

This approach follows common Business Intelligence best practices and prepares
the project for scalable dashboard development using Looker Studio.