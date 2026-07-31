# Dashboard Specification

## Overview

This document defines the functional specification of the Executive Sales Dashboard.

Its purpose is to describe every dashboard component, including its business objective, visualization type, analytical source and displayed metric before the implementation phase in Looker Studio.

The dashboard is intended for executive users who need a concise overview of the company's commercial performance.

---

## Dashboard Objective

Provide executives with a concise overview of e-commerce sales performance by presenting key business KPIs, revenue trends, product performance and market distribution to support strategic decision-making.

---

## Target Audience

- Commercial Director
- Sales Managers
- Business Executives

---

## Dashboard Layout

The dashboard follows a **Z-pattern** layout to guide users naturally through the information hierarchy.

Information is presented in the following order:

1. Executive Overview
2. Business Growth
3. Product Performance
4. Market Performance

---

# Dashboard Components

## Component 01 — Total Revenue

| Property | Value |
|----------|-------|
| Business Question | How much revenue has the business generated? |
| Visualization | KPI Card |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) |
| Filter | status = 'Complete' |
| Position | Executive Overview |
| Priority | High |

---

## Component 02 — Total Orders

| Property | Value |
|----------|-------|
| Business Question | How many completed orders were placed? |
| Visualization | KPI Card |
| Source | analytics.vw_sales |
| Metric | COUNT(DISTINCT order_id) |
| Filter | status = 'Complete' |
| Position | Executive Overview |
| Priority | High |

---

## Component 03 — Average Order Value

| Property | Value |
|----------|-------|
| Business Question | What is the average revenue generated per completed order? |
| Visualization | KPI Card |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) / COUNT(DISTINCT order_id) |
| Filter | status = 'Complete' |
| Position | Executive Overview |
| Priority | High |

---

## Component 04 — Monthly Revenue Trend

| Property | Value |
|----------|-------|
| Business Question | How has revenue evolved over time? |
| Visualization | Line Chart |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) |
| Dimension | year_month |
| Filter | status = 'Complete' |
| Position | Business Growth |
| Priority | High |

---

## Component 05 — Monthly Orders Trend

| Property | Value |
|----------|-------|
| Business Question | How has the number of completed orders evolved over time? |
| Visualization | Line Chart |
| Source | orders |
| Metric | COUNT(order_id) |
| Dimension | year_month |
| Filter | status = 'Complete' |
| Position | Business Growth |
| Priority | High |

---

## Component 06 — Revenue by Category

| Property | Value |
|----------|-------|
| Business Question | Which product categories generate the highest revenue? |
| Visualization | Horizontal Bar Chart |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) |
| Dimension | category |
| Filter | status = 'Complete' |
| Position | Product Performance |
| Priority | Medium |

---

## Component 07 — Top Products by Revenue

| Property | Value |
|----------|-------|
| Business Question | Which products generate the highest revenue? |
| Visualization | Horizontal Bar Chart |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) |
| Dimension | product_name |
| Filter | status = 'Complete' |
| Position | Product Performance |
| Priority | Medium |

---

## Component 08 — Revenue by Country

| Property | Value |
|----------|-------|
| Business Question | Which countries generate the highest revenue? |
| Visualization | Horizontal Bar Chart |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) |
| Dimension | country |
| Filter | status = 'Complete' |
| Position | Market Performance |
| Priority | Medium |

---

## Component 09 — Average Order Value by Country

| Property | Value |
|----------|-------|
| Business Question | Which countries have the highest average order value? |
| Visualization | Horizontal Bar Chart |
| Source | analytics.vw_sales |
| Metric | SUM(sale_price) / COUNT(DISTINCT order_id) |
| Dimension | country |
| Filter | status = 'Complete' |
| Position | Market Performance |
| Priority | Medium |