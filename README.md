Superstore Sales Analysis — SQL + Power BI Dashboard
A complete end-to-end data analytics project using the Superstore dataset, featuring SQL analysis and a 3-page interactive Power BI dashboard.
---
 Project Structure
```
superstore-analysis/
│
├── data/
│   └── superstore.csv
│
├── sql/
│   └── superstore_sql.sql
│
├── screenshots/
│   ├── page1_sales_dashboard.png
│   ├── page2_profit_analysis.png
│   └── page3_customer_analysis.png
│
└── README.md
```
---
 Dashboard Pages
Page 1 — Sales Dashboard
Total Sales: $2.30M | Total Orders: 9,994 | Products: 1,862 | Customers: 793
Visuals: Sales by Segment, Sales by Category, Sales by State (Map), Sales per Year
Key Insight: Sales grew 47% from 2014 to 2017
Page 2 — Profit Analysis
Total Profit: $286.40K | Profit %: 12.47% | Total Discount: 1.56K
Visuals: Profit by Category, Profit by Region, Profit by Year, Top 10 Products table
Key Insight: Technology generates the highest profit at $0.15M
Page 3 — Customer Analysis
Total Customers: 793 | Avg Order Value: $458.63 | Total Orders: 9,994
Visuals: Sales by Segment, Orders by Ship Mode (Donut), Top 10 Customers table
Key Insight: Standard Class dominates shipping at 58.76%
---
 SQL Queries Covered
Basic Queries
Query	Description
Total Sales per Year	Revenue trend across 2014–2017
Top 10 Customers by Sales	Highest revenue generating customers
Sales by Category	Technology, Furniture, Office Supplies
Region-wise Total Sales	Performance across West, East, South, Central
Loss-making Products	Products with negative total profit
Total Number of Orders	Distinct order count
Sales by Ship Mode	Revenue per shipping method
Total Sales by Segment	Consumer, Corporate, Home Office
Advanced Queries
Query	Concepts Used
Highest Profit Margin Category	Aggregation, calculated fields
Repeat Customers	HAVING clause, COUNT DISTINCT
Best Performing Month	CTE, RANK() window function
Underperforming Region	GROUP BY, ORDER BY, LIMIT
Second Highest Sales Customer	CTE, DENSE_RANK() window function
Declining Sales Products	CTE, LAG() window function
Top Product in Each Category	CTE, ROW_NUMBER() window function
Profit Ratio by Category	Aggregation, percentage calculation
---
 Key Insights
Sales grew 47% from 2014 to 2017 — Consistent year-over-year growth shows strong business expansion.
Technology is the most profitable category — Leads profit at $0.15M while Furniture barely breaks even at $0.02M.
West region leads in profit — West tops at $108K, Central is the weakest at $40K.
Consumer segment dominates sales — Accounts for $1.16M, nearly double Corporate ($0.71M).
Standard Class is the preferred shipping mode — Nearly 60% of orders use it, showing customers prefer cost over speed.
---
 Business Recommendations
Reduce discounts on Furniture — Heavy discounting is hurting margins. Focus on higher-margin products.
Invest more in West + Technology — This is the most profitable combination. Increase marketing and inventory focus here.
---
 Tools Used
Tool	Purpose
PostgreSQL	Data storage and SQL analysis
Power BI	Dashboard and data visualization
CSV / Excel	Raw data source
GitHub	Portfolio hosting
---
 Dataset
Source: Kaggle — Superstore Dataset
Records: 9,994 rows
Fields: 22 columns
---
👤 Author
Your Name
Vandana Hegde
LinkedIn:www.linkedin.com/in/vandanagh
GitHub: your-github
---
This project was built as part of a 7-day data analytics challenge.
