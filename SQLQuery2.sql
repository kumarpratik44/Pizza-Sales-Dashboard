
use Pizza_db;

select * from pizza_sales;

-- 1.	Total Revenue

select sum(total_price) as Total_Revenue from pizza_sales;

--2.	AVERAGE ORDER VALUE

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS AVG_ORDER_VAL FROM pizza_sales;

--3.	TOTAL PIZZA SOLD

SELECT sum(quantity) as Total_Pizza_Sale  FROM pizza_sales; 

--4.	TOTAL ORDER

SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales;

--5.	AVERAGE PIZZ PER ORDER

SELECT CAST(CAST (SUM(quantity) AS DECIMAL(10,2) )/CAST( COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) 
Avg_Pizza_Per_Order FROM pizza_sales;

--6.	Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--7.	Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

--8.	Percentage of Sales by Pizza Category

SELECT pizza_category,sum(total_price) as Total_Sales, sum(total_price) * 100 / 
(SELECT SUM (total_price) from pizza_sales WHERE MONTH (order_date) = 1) AS PCT
FROM pizza_sales 
WHERE MONTH (order_date) = 1
GROUP BY pizza_category

--9.	Percentage of Sales by Pizza Size

SELECT pizza_size,CAST(sum(total_price) AS DECIMAL (10,2)) as Total_Sales,CAST( sum(total_price) * 100 / 
(SELECT SUM (total_price) from pizza_sales) as DECIMAL(10,2)) AS PCT
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC

--10.	Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue  FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--11.	Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders


SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue  FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--12.	TOP 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity  FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity  DESC

--13.	Bottom 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_SOld FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_SOld  ASC

--14.	TOP 5 Pizzas by Total Orders

SELECT TOP 5 pizza_name, COUNT (DISTINCT order_id) AS Total_Order FROM pizza_sales
GROUP BY pizza_name
ORDER BY  Total_Order DESC


--15.	Bottom  5 Pizzas by Total Orders

SELECT TOP 5 pizza_name, COUNT (DISTINCT order_id) AS Total_Order FROM pizza_sales
GROUP BY pizza_name
ORDER BY  Total_Order ASC 



