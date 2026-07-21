# Superstore Sales Analysis — SQL + Power BI Dashboard

## Business Problem
Retail leadership needs to understand where sales and profit are actually being generated — by category, region, segment, and customer — versus where the business is losing money despite strong revenue. This analysis uses four years of Superstore transaction data to identify the highest and lowest performing areas of the business, and to separate high-sales categories from high-profit categories, since the two don't always overlap.

## Dataset
- **Source:** [Kaggle — Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Size:** 9,994 rows, 22 columns, spanning 2014–2017
- **Key variables:** order/ship date, customer, segment, region, category, sub-category, sales, quantity, discount, profit, ship mode

## Tools & Technologies
- **PostgreSQL** — data storage and SQL analysis
- **Power BI** — 3-page interactive dashboard

## Key Questions Answered
1. How has total revenue trended year over year?
2. Which categories and regions drive the most sales and profit — and do they match?
3. Which products or categories are losing money despite generating sales?
4. Which customers and segments contribute the most revenue?
5. What shipping and ordering patterns exist across the customer base?

## Key Findings
- **Sales grew 47% from 2014 to 2017**, showing consistent year-over-year business expansion.
- **Technology is the most profitable category at $0.15M in profit**, while Furniture barely breaks even at $0.02M — high sales in a category doesn't guarantee high profit.
- **The West region leads in profit at $108K; Central is the weakest at $40K**, despite likely having comparable sales volume.
- **The Consumer segment dominates sales at $1.16M**, nearly double Corporate's $0.71M.
- **Standard Class shipping accounts for nearly 60% of all orders**, indicating customers generally prioritize cost over delivery speed.
- Overall: **$2.30M total sales, $286.40K total profit (12.47% margin), 9,994 orders, 793 customers, 1,862 products.**

## Business Recommendations
1. **Reduce discounting on Furniture.** Heavy discounts appear to be compressing margins on a category that already barely breaks even — shifting promotional focus toward higher-margin categories would protect profit.
2. **Invest further in West region + Technology category.** This is the strongest profit combination in the dataset; increasing marketing and inventory focus here is likely to compound existing strength rather than chase underperforming areas.
3. **Investigate Central region's weaker profit performance** relative to other regions, to determine whether it's a discounting, cost, or demand issue.

## Dashboard / Visualisations
Three pages:

**Page 1 — Sales Dashboard**: Total Sales ($2.30M), Total Orders (9,994), Products (1,862), Customers (793); Sales by Segment, Category, State (map), and Year.

**Page 2 — Profit Analysis**: Total Profit ($286.40K), Profit % (12.47%), Total Discount ($1.56K); Profit by Category, Region, Year, and a Top 10 Products table.

**Page 3 — Customer Analysis**: Total Customers (793), Avg Order Value ($458.63), Total Orders (9,994); Sales by Segment, Orders by Ship Mode (donut), and a Top 10 Customers table.


## A Note on Methodology
The SQL analysis was intentionally split across two tiers — basic aggregation (sales by year, category, region, ship mode) and advanced window-function queries (best performing month via `RANK()`, second-highest customer via `DENSE_RANK()`, declining products via `LAG()`, top product per category via `ROW_NUMBER()`) — to answer not just "what happened" but "what changed" and "who's near the top but not quite there," which flat aggregation alone can't surface.
