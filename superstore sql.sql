

=========================================================
   SUPERSTORE SALES ANALYSIS PROJECT
   Tool: PostgreSQL
   Purpose: Analyze sales performance, customer behavior,
            and business trends.
========================================================= 


CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Region VARCHAR(20),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales NUMERIC(10,2),
    Quantity INT,
    Discount NUMERIC(5,2),
    Profit NUMERIC(10,2),
    Profit_Status VARCHAR(10)
);


COPY superstore
FROM 'C:\data\superstore csv for sql.csv'
DELIMITER ','
CSV HEADER;

UPDATE superstore
SET profit_status = CASE 
    WHEN profit > 0 THEN 'Profit'
    WHEN profit < 0 THEN 'Loss'
    ELSE 'Break Even'
END;



=========================================================
 SECTION 1: BASIC ANALYSIS
========================================================= 

SELECT * FROM superstore


=========================================================
1. TOTAL SALES PER YEAR
   Purpose: Identify overall revenue trend over time
   Insight: Helps understand growth pattern of business
=========================================================
SELECT EXTRACT(YEAR from order_date) as year,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY year
ORDER BY year ASC;

=========================================================
2. TOP 10 CUSTOMERS BY SALES
   Purpose: Identify high-value customers
   Insight: Top customers contribute significantly to revenue
========================================================= 
SELECT customer_name,
       SUM(sales)AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


=========================================================
3. SALES BY CATEGORY
   Purpose: Compare performance across product categories
   Insight: Technology category usually generates highest revenue
=========================================================
SELECT category,
       SUM(sales)as total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;
     

=========================================================
4. REGION-WISE TOTAL SALES
   Purpose: Analyze geographical performance
   Insight: Helps identify strongest and weakest regions
========================================================= 
SELECT region,
       SUM(sales)AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


=========================================================
5. LOSS-MAKING PRODUCTS
   Purpose: Identify products generating negative profit
   Insight: Indicates pricing or cost issues
=========================================================
SELECT product_name,
	   SUM(profit)as total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit)< 0;


=========================================================
6. TOTAL NUMBER OF ORDERS
   Purpose: Measure business volume
   Insight: Shows overall transaction count
=========================================================
SELECT COUNT(DISTINCT order_id)as total_orders
FROM superstore;


=========================================================
7. SALES BY SHIP MODE
   Purpose: Analyze shipping preferences
   Insight: Identifies most used delivery method
=========================================================
SELECT ship_mode,
       SUM(sales)AS total_sales
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;







=========================================================
   SECTION 2: ADVANCED ANALYSIS
=========================================================


=========================================================
8. SALES BY SEGMENT
   Purpose: Understand customer segmentation
   Insight: Consumer segment contributes highest revenue
=========================================================
SELECT segment,
       SUM(sales)AS total_sale
FROM superstore
GROUP BY segment
ORDER BY total_sale DESC;



=========================================================
9. PROFIT MARGIN BY CATEGORY
   Purpose: Measure profitability efficiency
   Insight: High sales doesn’t always mean high profit
=========================================================
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND(SUM(profit) * 100.0 / SUM(sales), 2) AS profit_margin_percentage
FROM superstore
GROUP BY category
ORDER BY profit_margin_percentage DESC;


=========================================================
10. REPEAT CUSTOMERS
   Purpose: Identify customer retention
   Insight: Repeat customers indicate business loyalty
=========================================================
SELECT customer_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;



=========================================================
11. BEST PERFORMING MONTH
   Purpose: Identify peak sales period
   Insight: Helps in seasonal planning
========================================================= 
WITH best_month AS ( SELECT
                           EXTRACT(YEAR FROM order_date) AS year,
                           EXTRACT(MONTH FROM order_date) AS month,
                           SUM(sales) AS total_sales
                    FROM superstore
                    GROUP BY EXTRACT(YEAR FROM order_date),
                             EXTRACT(MONTH FROM order_date)),

ranked AS ( SELECT *,
            RANK() OVER (ORDER BY total_sales DESC) AS rnk
            FROM best_month)

SELECT *
FROM ranked
WHERE rnk = 1;



=========================================================
12. UNDERPERFORMING REGION
   Purpose: Identify lowest performing region
   Insight: Helps focus improvement strategies
=========================================================
SELECT region,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales ASC
LIMIT 1;



=========================================================
13. SECOND HIGHEST SALES CUSTOMER
   Purpose: Identify near-top customer
   Insight: Useful for targeted marketing
========================================================= 
WITH customer_sales AS (SELECT customer_name,
                               SUM(sales) AS total_sales
                        FROM superstore
                       GROUP BY customer_name),

ranked AS ( SELECT *,
            DENSE_RANK() OVER (ORDER BY total_sales DESC) AS rnk
            FROM customer_sales)
SELECT *
FROM ranked
WHERE rnk = 2;



=========================================================
14. DECLINING SALES PRODUCTS
   Purpose: Identify products with decreasing sales
   Insight: Indicates demand drop or competition impact
=========================================================
WITH sales_data AS ( SELECT product_name,
                            EXTRACT(YEAR FROM order_date) AS year,
                            SUM(sales) AS current_year_sales
                     FROM superstore
                     GROUP BY product_name, year),
					 
lag_sales AS (SELECT *,
              LAG(current_year_sales) OVER (PARTITION BY product_name ORDER BY year) AS previous_year_sale
              FROM sales_data)
			  
SELECT *,
       (current_year_sales - previous_year_sale) AS decline_amount
FROM lag_sales
WHERE previous_year_sale IS NOT NULL
AND current_year_sales < previous_year_sale
ORDER BY decline_amount ASC;



=========================================================
15. TOP PRODUCT IN EACH CATEGORY
   Purpose: Identify best-selling product per category
   Insight: Helps in inventory and promotion decisions
========================================================= 
WITH product_sales AS (SELECT category,
                            product_name,
                            SUM(sales) AS total_sales
                       FROM superstore
                      GROUP BY category, product_name),

ranked AS (SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS rnk
           FROM product_sales)

SELECT *
FROM ranked
WHERE rnk = 1;



=========================================================
15.PROFIT RATIO CATEGORY
   PURPOSE: To evaluate profitability across different product categories
   INSIGHT: Helps identify which categories are most efficient in generating profit
            relative to sales revenue
========================================================= 
SELECT category,
       SUM(profit) AS total_profit,
       SUM(sales) AS total_sales,
       ROUND(SUM(profit) * 100.0 / SUM(sales), 2) AS profit_margin_percentage
FROM superstore
GROUP BY category
ORDER BY profit_margin_percentage DESC;






