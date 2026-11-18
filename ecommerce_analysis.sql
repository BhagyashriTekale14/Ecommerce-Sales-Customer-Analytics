-- E-Commerce Sales & Customer Analytics
-- Run after importing data/ecommerce_sales_clean.csv into a table named ecommerce_sales.

-- 1. Overall KPIs
SELECT COUNT(DISTINCT order_id) AS total_orders,
       COUNT(DISTINCT customer_id) AS unique_customers,
       ROUND(SUM(revenue),2) AS total_revenue,
       ROUND(SUM(profit),2) AS total_profit,
       ROUND(SUM(profit)/NULLIF(SUM(revenue),0)*100,2) AS profit_margin_pct
FROM ecommerce_sales;

-- 2. Monthly sales and profit
SELECT DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
       ROUND(SUM(revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 3. Category performance
SELECT category, SUM(quantity) AS units_sold,
       ROUND(SUM(revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;

-- 4. Regional performance
SELECT region, COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM ecommerce_sales
GROUP BY region
ORDER BY profit DESC;

-- 5. Top 10 customers by lifetime revenue
SELECT customer_id, COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(revenue),2) AS lifetime_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- 6. Product ranking using a window function
SELECT product_name, revenue,
       DENSE_RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM (
  SELECT product_name, SUM(revenue) AS revenue
  FROM ecommerce_sales
  GROUP BY product_name
) p;

-- 7. Channel performance
SELECT sales_channel, COUNT(*) AS orders,
       ROUND(SUM(revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM ecommerce_sales
GROUP BY sales_channel
ORDER BY revenue DESC;

-- 8. Discount band analysis
SELECT CASE
         WHEN discount_pct = 0 THEN 'No discount'
         WHEN discount_pct <= 0.05 THEN '1-5%'
         WHEN discount_pct <= 0.10 THEN '6-10%'
         WHEN discount_pct <= 0.15 THEN '11-15%'
         ELSE 'Above 15%'
       END AS discount_band,
       COUNT(*) AS orders,
       ROUND(SUM(revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM ecommerce_sales
GROUP BY discount_band
ORDER BY MIN(discount_pct);

-- 9. Customers with repeat purchases
SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
FROM ecommerce_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY order_count DESC;
