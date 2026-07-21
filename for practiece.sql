CREATE TABLE customers (
  customer_id  SERIAL       PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  email        VARCHAR(150) UNIQUE,
  city         VARCHAR(50),
  signup_date  DATE
);

CREATE TABLE products (
  product_id  SERIAL        PRIMARY KEY,
  name        VARCHAR(150)  NOT NULL,
  category    VARCHAR(50),
  price       NUMERIC(10,2),
  stock_qty   INT           DEFAULT 0
);

CREATE TABLE orders (
  order_id      SERIAL       PRIMARY KEY,
  customer_id   INT          REFERENCES customers(customer_id),
  order_date    DATE,
  status        VARCHAR(20)  CHECK (status IN (
                  'Processing', 'Shipped', 'Delivered', 'Cancelled')),
  total_amount  NUMERIC(10,2)
);

CREATE TABLE order_items (
  item_id     SERIAL        PRIMARY KEY,
  order_id    INT           REFERENCES orders(order_id),
  product_id  INT           REFERENCES products(product_id),
  quantity    INT,
  unit_price  NUMERIC(10,2)
);

INSERT INTO customers (customer_id, name, email, city, signup_date) VALUES
(1, 'Arjun Sharma',  'arjun@mail.com',  'Mumbai',    '2022-03-15'),
(2, 'Priya Nair',    'priya@mail.com',  'Bangalore', '2022-07-20'),
(3, 'Rohit Verma',   'rohit@mail.com',  'Delhi',     '2023-01-05'),
(4, 'Sneha Iyer',    'sneha@mail.com',  'Chennai',   '2023-04-18'),
(5, 'Karan Mehta',   'karan@mail.com',  'Mumbai',    '2023-09-30'),
(6, 'Divya Pillai',  'divya@mail.com',  'Bangalore', '2024-01-12'),
(7, 'Aditya Rao',    'aditya@mail.com', 'Hyderabad', '2024-05-07'),
(8, 'Meera Joshi',   'meera@mail.com',  'Pune',      '2024-08-22');

INSERT INTO products (product_id, name, category, price, stock_qty) VALUES
(101, 'Laptop Pro 15',              'Electronics', 75000, 50),
(102, 'Wireless Mouse',             'Electronics',  1200, 200),
(103, 'Office Chair',               'Furniture',   12000, 30),
(104, 'Standing Desk',              'Furniture',   25000, 15),
(105, 'Noise Cancelling Headphones', 'Electronics',  8500, 80),
(106, 'Mechanical Keyboard',        'Electronics',  4500, 120),
(107, 'Notebook Set',               'Stationery',    350, 500),
(108, 'Webcam HD',                   'Electronics',  3200, 60);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(1001, 1, '2024-01-10', 'Delivered',  76200),
(1002, 2, '2024-02-14', 'Delivered',  13200),
(1003, 3, '2024-03-05', 'Shipped',    25000),
(1004, 1, '2024-04-20', 'Delivered',   4500),
(1005, 4, '2024-05-01', 'Cancelled',   8500),
(1006, 5, '2024-06-15', 'Delivered',   9700),
(1007, 2, '2024-07-22', 'Processing',  3550),
(1008, 6, '2024-08-09', 'Delivered',  37200),
(1009, 7, '2024-09-18', 'Shipped',     1200),
(1010, 3, '2024-10-30', 'Delivered',    700);

INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price) VALUES
(1,  1001, 101, 1, 75000),
(2,  1001, 102, 1,  1200),
(3,  1002, 103, 1, 12000),
(4,  1002, 102, 1,  1200),
(5,  1003, 104, 1, 25000),
(6,  1004, 106, 1,  4500),
(7,  1005, 105, 1,  8500),
(8,  1006, 102, 2,  1200),
(9,  1006, 108, 1,  3200),
(10, 1006, 107, 3,   350),
(11, 1007, 108, 1,  3200),
(12, 1008, 104, 1, 25000),
(13, 1008, 101, 1, 75000),
(14, 1009, 102, 1,  1200);



--Write a query to find the top 3 customers by their total spending across all delivered orders only. Show their name, city, and total amount spent.

select * from customers;
select * from products;
select * from orders;
select * from order_items;

select c.customer_id,c.name, c.city, sum(o.total_amount) as total_spent
from customers c 
join orders o
on c.customer_id = o.customer_id
where o.status ='Delivered'
group by c.customer_id,c.name, c.city
order by total_spent desc
limit 3;

with ranking as  (select c.customer_id,c.name, c.city, sum(o.total_amount) as total_spent
                  from customers c 
                  join orders o
                  on c.customer_id = o.customer_id
				  where o.status ='Delivered'
				  group by c.customer_id,c.name, c.city ),
	
ranked as (select *,
	       rank()over(order by total_spent desc) as rnk
           from ranking)       
select * 
from ranked
where rnk <= 3;  



--Write a query to find all products that have never been ordered. Show product name and category. Solve it using at least two different approaches.

select p.name, p.category, p.product_id, oi.order_id
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.product_id is null ;

SELECT 
    name,
    category
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);







Find the total spending of each customer and display the highest spender first.
Find the top 3 products generating the highest revenue.
Find customers who placed more than one order.
Find all orders that contain more than one product.
Find the most purchased product category based on quantity sold.
Find customers who have never placed any orders.
Calculate monthly revenue considering only delivered orders.
Find the second highest priced product.
Find the average order value for each city.
Find products that were never ordered.
Intermediate Level Questions
Find the total quantity sold for each product.
Find customers who ordered products from more than one category.
Find the latest order placed by each customer.
Find the total number of delivered, shipped, cancelled, and processing orders.
Find products whose stock quantity is less than 50.
Find the customer who placed the maximum number of orders.
Find the order with the highest total amount.
Find the average product price in each category.
Find all customers who ordered Electronics products.
Find orders placed in the first half of 2024.
Advanced Interview Questions
Rank customers based on their total spending.
Find cumulative (running) revenue by order date.
Find the top-selling product in each category.
Find customers whose total spending is above the average customer spending.
Find products that were ordered only once.
Find duplicate cities from the customers table with customer counts.
Find the percentage contribution of each category to total revenue.
Find orders where total_amount does not match the sum of order_items.
Find the month with the highest sales.
Find customers who purchased both Electronics and Furniture products.
Scenario-Based Questions (Very Common in Interviews)
A manager wants to know which city generates the highest revenue. Write a query.
Identify inactive customers who signed up but never ordered.
Find products contributing to 80% of total sales revenue.
Identify customers likely to be premium customers based on spending patterns.
Find the average time gap between orders for customers with multiple orders.
Generate a sales report showing category-wise revenue and total quantity sold.
Find cancelled orders and the products involved in those orders.
Find customers whose every order was delivered successfully.
Find the most frequently ordered product.
Find the least selling category.
Window Function Practice Questions
Assign row numbers to orders based on order date.
Rank products by revenue within each category.
Find the previous order amount for each customer using LAG().
Find the next order date for each customer using LEAD().
Calculate moving average of revenue over order dates.
Find top 2 highest spending customers.
Divide customers into 4 spending groups using NTILE().
Find the first order of every customer.
Find the difference between current and previous order amount.
Find customers whose spending increased compared to their previous order.
