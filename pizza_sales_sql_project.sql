SELECT * FROM pizza_sales

--1) Total Revenue
SELECT ROUND(SUM(total_price),2) AS Total_Revenue 
FROM pizza_sales

--2) Average Order Value

SELECT (SUM(total_price)/COUNT(DISTINCT order_id )) as Avg_Order_Value 
FROM pizza_sales

--3. Total Pizzas Sold

SELECT SUM(quantity) as Total_pizza_sold FROM pizza_sales

--4. Total Orders

SELECT COUNT(distinct order_id ) as total_orders from pizza_sales

--5. Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
             CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_per_order
FROM pizza_sales;


--Daily Trend for Total Orders

SELECT DATENAME(DW , order_date) as order_day , COUNT(DISTINCT order_id ) as Total_order
from pizza_sales
GROUP BY DATENAME(DW , order_date)


--Monthly Trend for Orders
SELECT DATENAME(MONTH , order_date) as order_day , COUNT(DISTINCT order_id ) as Total_orders
from pizza_sales
GROUP BY DATENAME(MONTH , order_date)
ORDER BY Total_orders DESC


-- % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--% of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size 
ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category

SELECT pizza_category , SUM(quantity) as Total_quantity_sold 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY  Total_quantity_sold desc

--Top 5 Pizzas by Revenue

SELECT TOP 5 pizza_name , SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Revenue  desc

-- Bottom 5 Pizzas by Revenue

SELECT TOP 5 pizza_name , SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Revenue ASC


--Top 5 Pizzas by Quantity

SELECT TOP 5 pizza_name , SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quantity_sold DESC

--Bottom 5 Pizzas by Quantity

SELECT TOP 5 pizza_name , SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quantity_sold ASC

-- Top 5 Pizzas by orders

SELECT TOP 5 pizza_name , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_orders desc

--Bottom 5 Pizzas by Total Orders

SELECT TOP 5 pizza_name , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_orders ASC