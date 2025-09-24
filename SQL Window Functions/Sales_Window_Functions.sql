/*
===============================================================================
Window Functions
===============================================================================
*/


-- Cumulative sales and moving average prices

SELECT
    order_date,
    total_sales,
    average_price,
    SUM(total_sales) OVER (PARTITION BY YEAR(order_date) ORDER BY order_date) AS running_total_sales,
    AVG(average_price) OVER (ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_price
FROM
    (SELECT 
        DATETRUNC(MONTH, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS average_price
    FROM [company.fact_sales]
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(MONTH, order_date)
    ) t;

-- Yearly performance: current year sales vs average sales and previous year sales

WITH yearly_sales AS (
    SELECT 
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM [company.fact_sales] f
    LEFT JOIN [company.products] p
        ON f.product_key = p.product_key
    WHERE order_date IS NOT NULL
    GROUP BY YEAR(f.order_date), p.product_name
)
SELECT 
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM yearly_sales
ORDER BY product_name, order_year;


-- Top-selling products by category with rankings

WITH product_sales AS (
    SELECT 
        p.product_name,
        p.category,
        SUM(f.sales_amount) AS total_sales,
        SUM(f.quantity) AS total_quantity
    FROM [company.fact_sales] f
    LEFT JOIN [company.products] p
        ON f.product_key = p.product_key
    GROUP BY p.product_name, p.category
)
SELECT 
    product_name,
    category,
    total_sales,
    total_quantity,
    RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS sales_rank,
    DENSE_RANK() OVER (PARTITION BY category ORDER BY total_quantity DESC) AS quantity_rank
FROM product_sales
ORDER BY category, sales_rank;


-- Each product category's contribution to total sales

WITH category_sales AS (
    SELECT 
        category,
        SUM(sales_amount) AS total_sales
    FROM [company.fact_sales] f
    LEFT JOIN [company.products] p
        ON f.product_key = p.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    CONCAT(ROUND((CAST (total_sales AS FLOAT) / SUM(total_sales) OVER ())*100, 2), '%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

