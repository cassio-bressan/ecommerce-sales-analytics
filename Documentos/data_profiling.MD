# Data Profiling

## Objective

The purpose of this document is to summarize the exploratory analysis performed on the selected dataset before developing the analytical layer.

The objective is to understand the data structure, validate its integrity and identify potential limitations that may impact business analyses.

---

# 1. Dataset Overview

The first step consisted of evaluating the size of each selected entity.

| Table | Records |
|--------|---------:|
| users | 100,000 |
| orders | 124,913 |
| products | 29,120 |
| order_items | 181,225 |

The dataset contains sufficient volume for realistic analytical scenarios while remaining suitable for development within the BigQuery free tier.

---

# 2. Time Coverage

The temporal coverage of the dataset was evaluated using the creation dates of users and orders.

## Users

- First registration: **2019-01-02**
- Last registration: **2026-07-06**

## Orders

- First order: **2019-01-09**
- Last order: **2026-07-06**

Result:
The customer base begins approximately one week before the first recorded order, which is consistent with the expected business process. Overall, the dataset covers approximately **7 years and 6 months** of business activity.

---

# 3. Primary Key Validation

The primary identifiers of all selected entities were validated for uniqueness and completeness.

The following columns were evaluated:

- users.id
- orders.order_id
- products.id
- order_items.id

Result:
No duplicate values were identified. No NULL values were identified. These results indicate that the primary entities preserve uniqueness and can safely support analytical joins and transformations.

---

# 4. Referential Integrity

*Pending investigation.*

---

# 5. Missing Values

*Pending investigation.*

---

# 6. Domain Analysis

*Pending investigation.*

---

# 7. Data Quality Summary

*Pending completion.*