# Window Functions in SQL

## Description
This SQL script demonstrates the use of window functions in SQL to derive business insights from product sales data.

## Main Goals
- Calculate trends:
  - Cumulative sales for each year 
  - 3-month moving average prices 
  - Techniques: Aggregation, partitioning, ordering
- Analyze yearly product performance by comparing:
  - Current year sales vs overall average sales
  - Current year sales vs previous year sales
  - Techniques: LAG(), aggregation, partitioning, ordering
- Identify top-selling products by category, assigning:
  - Rankings based on total sales
  - Rankings based on quantity sold
  - Techniques: RANK(), DENSE_RANK()
- Determine each product category's percentage of total sales
  - Techniques: Aggregation, partitioning

## Tools Used
- SQL Server Management Studio

## Results Interpretation
The analysis provides the following insights:
- Although 2021 and 2022 started with similar sales, the running total shows that 2022 experienced flatter growth, resulting in lower total annual sales. In contrast, 2023 shows dramatic growth compared to both 2021 and 2022.
- The moving average price for 2021 shows a consistent high-price strategy, however it falls significantly throughout 2022 and into early 2023.This suggests a shift in business strategy, where the company increased total sales in 2023 by selling more products at lower prices.
- Most products performed better in 2023 than in 2022. However, a few products, such as the Laptop-250 Black-52, Laptop-250 Black-58, and Laptop-250 Red-58, saw a decrease in sales and may require attention and adjustment. 
- Sales Leaders: Caps in Accessories, Women's Shorts and Jerseys in Clothing, and the Laptop-200 Series in Tech. Quantity Leaders: Water Bottle-30 and Patch Kit-8 in Accessories, Socks and Gloves in Clothing, and the Laptop-200 Series in Tech. The Laptop-200 Series is the best-performing product overall.
- The Patch Kit-8 is a top seller by quantity but has the lowest sales ranks, suggesting it may frequently be used as an add-on item for purchases. 
- Products like Racing Socks, Men's T-Shirts, and the Phone-500 series rank at the bottom for both sales and quantity, indicating a need for review.
- The Tech category accounts for the vast majority of sales (approximately 96%), while Accessories and Clothing together constitute only about 4%.

## Future Use
This script is a valuable tool for the marketing department to review product performance and adjust strategies. It is also useful for future budget allocation and inventory planning.
