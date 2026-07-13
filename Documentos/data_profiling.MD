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

The foreign key relationships between the selected entities were validated.

The following relationships were tested:

- orders.user_id → users.id
- order_items.order_id → orders.order_id
- order_items.product_id → products.id
- order_items.user_id → users.id

No orphan records were identified.

This confirms that the selected entities maintain referential integrity and can be safely joined during analytical transformations.

---

# 5. Missing Values

*Pending investigation.*

---

# 6. Domain Analysis

The main categorical columns of the selected entities were analyzed to identify their possible values and evaluate data consistency.

## Orders

The `status` column contains five standardized values:

| Status | Records |
|---------|---------:|
| Shipped | 37,664 |
| Complete | 31,085 |
| Processing | 24,806 |
| Cancelled | 18,854 |
| Returned | 12,395 |

No inconsistent spellings, unexpected values or capitalization issues were identified.

---

## Order Items

The `status` column contains the same five standardized values found in the `orders` table.

| Status | Records |
|---------|---------:|
| Shipped | 54,804 |
| Complete | 44,926 |
| Processing | 36,025 |
| Cancelled | 27,387 |
| Returned | 18,052 |

The consistency between both transactional tables indicates that the order lifecycle is represented using a standardized domain.

---

## Users

The `gender` column contains only two values.

| Gender | Records |
|---------|---------:|
| F | 50,061 |
| M | 49,939 |

No NULL or unexpected values were identified.

---

## Products

The `department` column contains two standardized values.

| Department | Products |
|------------|---------:|
| Women | 15,989 |
| Men | 13,131 |

The `category` column contains **26 distinct categories**, all consistently named without duplicated values caused by spelling or capitalization differences.

No domain inconsistencies were identified in the analyzed categorical columns.

---

# 7. Data Quality Summary

*Pending completion.*