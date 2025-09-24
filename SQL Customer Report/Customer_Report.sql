/*
===============================================================================
Customer Report
===============================================================================

Goals:
    1. Gather basic customer information (names, ages, transaction details).
	2. Calculate aggregated measures for each customer:
	   - total orders
	   - total spending
	   - total quantity purchased
	   - total distinct products purchased
	   - lifespan (in months)
    3. Segment customers into age groups and categories (VIP, Regular, New) based on total spending and customer lifespan.
    4. Calculate performance metrics:
	    - months since the last order
		- average order value
		- average monthly spending
===============================================================================
*/

-- Create Report: company.report_customers

DROP VIEW IF EXISTS [company.report_customers];  
GO 

CREATE VIEW [company.report_customers] AS

WITH base AS (

-- Base query to get core columns from tables:

    SELECT
        f.order_number,
        f.product_key,
        f.order_date,
        f.sales_amount,
        f.quantity,
        c.customer_key,
        c.customer_number,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        DATEDIFF(YEAR, c.birthdate, GETDATE()) AS age
    FROM [company.fact_sales] f
    LEFT JOIN [company.customers] c
        ON f.customer_key = c.customer_key
    WHERE order_date IS NOT NULL
),

customer AS (

-- Customer level aggregations

    SELECT
        customer_key,
        customer_number,
        customer_name,
        age,
        COUNT(DISTINCT order_number) AS total_orders,
        SUM(sales_amount) AS total_spending,
        SUM(quantity) AS total_quantity,
        COUNT(DISTINCT product_key) AS total_products,
        MAX(order_date) AS last_order,
        DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
    FROM base
    GROUP BY customer_key, customer_number, customer_name, age
)

SELECT
    customer_key,
    customer_number,
    customer_name,
    age,
    total_orders,
    total_spending,
    total_quantity,
    total_products,
    lifespan,

-- Customer segmentation

    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    
    CASE 
        WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment,

-- Metrics calculations

    CASE 
        WHEN total_spending = 0 THEN 0
        ELSE total_spending / total_orders 
    END AS average_order_value,
    last_order,
    DATEDIFF(MONTH, last_order, GETDATE()) AS months_since_last,
    CASE 
        WHEN lifespan = 0 THEN total_spending
        ELSE total_spending / lifespan
    END AS average_monthly_spending
FROM customer;
