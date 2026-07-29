# Data Model

## Overview

The analytical solution is based on a subset of the original operational database provided by TheLook eCommerce dataset.

Only the entities required to support the commercial business objectives were included in the first iteration of the project.

---

## Operational Data Model

![Data Diagram](Documentos/Data_schema.png)

---

## Selected Tables

| Table | Purpose |
|--------|---------|
| users | Stores customer information. |
| orders | Stores order-level information. |
| order_items | Stores each individual product sold within an order. |
| products | Stores product catalog information. |

---

## Relationships

### users → orders

One customer can place multiple orders.

Relationship:

`users.id` → `orders.user_id`

Cardinality:

**1 : N**

---

### orders → order_items

One order may contain multiple products.

Relationship:

`orders.order_id` → `order_items.order_id`

Cardinality:

**1 : N**

---

### products → order_items

One product can appear in multiple order items.

Relationship:

`products.id` → `order_items.product_id`

Cardinality:

**1 : N**

---

### users → order_items

The dataset also includes a direct relationship between customers and order items through the `user_id` column.

This relationship appears to be a controlled redundancy intended to simplify analytical queries.

Relationship:

`users.id` → `order_items.user_id`

Cardinality:

**1 : N**

---

## Modeling Decisions

The original dataset contains additional entities that were intentionally excluded from the first version of the project.

Excluded tables:

- events
- inventory_items
- distribution_centers

These tables support marketing, inventory and logistics processes, which are outside the scope of the commercial analytics solution.

---

## Key Observations

The `order_items` table represents the central transactional entity of the project.

It connects customers, orders and products, making it the primary source for most commercial metrics such as revenue, sales volume and product performance.

For this reason, it is expected to become the foundation of the analytical layer developed in subsequent stages of the project.