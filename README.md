🛒 Superstore Sales Analysis — SQL + Power BI Dashboard
A complete end-to-end data analytics project using the Superstore dataset, featuring SQL analysis and a 3-page interactive Power BI dashboard.
---
📁 Project Structure
```
superstore-analysis/
│
├── data/
│   └── superstore csv for sql.csv        # Raw dataset
│
├── sql/
│   └── superstore_sql.sql                # All SQL queries
│
├── dashboard/
│   └── superstore_dashboard.pbix         # Power BI dashboard file
│
├── screenshots/
│   ├── page1_sales_dashboard.png
│   ├── page2_profit_analysis.png
│   ├── page3_customer_analysis.png
│   
│
└── README.md
```
---
📊 Dashboard Pages
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
🗄️ SQL Queries Covered
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
1. Sales grew 47% from 2014 to 2017
Consistent year-over-year growth across all regions indicates strong business expansion and increasing market demand.
2. Technology is the most profitable category
Technology generates the highest profit at $0.15M with strong margins, while Furniture barely breaks even at $0.02M despite significant sales volume.
3. West region leads in profit
The West region tops profit at $108K, followed by East at $92K. Central is the weakest performing region at just $40K profit.
4. Consumer segment dominates sales
The Consumer segment accounts for $1.16M in sales — nearly double Corporate ($0.71M) and almost triple Home Office ($0.43M).
5. Standard Class is the preferred shipping mode
Nearly 60% of all orders use Standard Class shipping, suggesting customers strongly prioritize cost savings over faster delivery.
---
   Business Recommendations
1. Reduce discounts on Furniture or rethink its strategy
Furniture has high sales volume but very low profit ($0.02M). Heavy discounting is likely hurting margins. The business should either reduce discounts or shift focus to higher-margin furniture products to improve profitability.
2. Invest more in West region + Technology category
Since West + Technology is the winning combination for profitability, the business should increase marketing spend, inventory focus, and promotional campaigns in this region-category pair to maximize returns.
---
Tools Used
Tool	Purpose
PostgreSQL	Data storage and SQL analysis
Power BI	Dashboard and data visualization
Microsoft Excel / CSV	Raw data source
GitHub	Version control and portfolio hosting
---
📂 Dataset
Source: Kaggle — Superstore Dataset
Records: 9,994 rows
Fields: 22 columns including sales, profit, region, category, customer, ship mode
---
🚀 How to Run
Clone this repository
```bash
git clone https://github.com/yourusername/superstore-analysis.git
```
Import the CSV into PostgreSQL
```sql
COPY superstore FROM 'your/path/superstore.csv' DELIMITER ',' CSV HEADER;
```
Run the SQL queries from `sql/superstore_sql.sql`
Open `dashboard/superstore_dashboard.pbix` in Power BI Desktop
---
👤 Author
Vandana Hegde
LinkedIn: www.linkedin.com/in/vandanagh
GitHub: Vandanahegde01
---
This project was built as part of a 7-day data analytics challenge.
