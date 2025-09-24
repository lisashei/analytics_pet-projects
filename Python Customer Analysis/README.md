# Customer Analysis

## Description
A comprehensive statistical analysis of customer behavior patterns using Python. This project explores sales trends, tests hypotheses about customer spending, and provides data-driven recommendations for business strategy.

## Main Goals
The analysis addresses four research objectives:
- Exploring and visualizing data: monthly sales trends, product category performance comparison, customer age distribution, and customer type spending comparison.
- Addressing spending differences by testing the hypothesis that New and Returning customers have significantly different spending styles. 
- Checking discount effectiveness by testing whether conditional discounts increase the Average Order Value (AOV) for New customers.
- Identifying payment preferences by testing whether there is an association between the type of customer (New vs. Returning) and their preferred payment method.

## Statistical testing details
1. Welch's t-test was used to compare spending between New vs. Returning customers.
   - Null Hypothesis (H₀): There is no difference in average spending between New and Returning customers.
   - Alternative Hypothesis (H₁): There is a difference in average spending between New and Returning customers.
   - Assumptions of normality and variance equality were checked: results showed non-normality, however since the sample is large, Central Limit Theorem was followed, variances were unequal, justifying the use of Welch's t-test.

2. A/B Testing with Mann-Whitney U test was used to evaluate discount effectiveness for New customers.
   - Goal: Increase new customers' Average Order Value (AOV) by offering conditional discounts.
   - Experimental design: A 2-week experiment with random segmentation into 2 groups. Group A was not offered a discount, Group B was offered a conditional discount ("Spend $400+, get 20% off").
   - Since data showed non-normality, Mann-Whitney U test was used.
   - Null Hypothesis (H₀): There is no difference in average spending between Group A and Group B.
   - Alternative Hypothesis (H₁): There is a difference in average spending between Group A and Group B.

3. Chi-Square Test was used to analyze payment method preferences.
   - Null Hypothesis (H₀): There is no association between customer type and payment method.
   - Alternative Hypothesis (H₁): There is an association between customer type and payment method.
   - Post-hoc Analysis: Standardized residuals (z-scores) were analyzed to identify where the specific differences occur.

## Tools Used
- Python (numpy, pandas, matplotlib, seaborn, scipy)

## Results Interpretation
Several key insights:
- Across all regions the highest sales occurred in December (likely due to holidays), while the lowest were in March, June and July (possibly there were some issues in marketing campaigns that require investigation).
- Categories like Clothes and Cosmetics generated the highest total sales, while Footwear had the lowest.
- The core demographic is aged 25-45, with male customers tending to be younger than female customers.

Hypotheses testing results:
- Spending differences (t-test): the results show a statistically significant difference in average spending between customer types (p < 0.05). New customers have lower average spending than Returning customers. The business should prioritize retaining returning customers while improving new customer conversion (implementing loyalty programs for returning customers, incentives for new customers like discounts).
- Discount effectiveness (A/B Test): the experiment showed a significant difference in spending between groups (p < 0.05). The conditional discount successfully increased AOV for New customers, so it can be recommended to roll out the conditional discount program for all New customers.
- Payment preferences (Chi-Square Test): the test revealed a statistically significant association between customer type and payment method (p < 0.05). New customers prefer PayPal and avoid Debit cards, while Returning customers prefer Debit cards and avoid PayPal. Potential strategies include promoting PayPal fast checkout for new customers, offering first-time PayPal discounts and encouraging returning customers to save a debit card as their default payment method.

## Future Use
This analysis in Python provides valuable insights into customer behavior. The results can be used to adjust marketing strategies, optimize payment systems, and develop targeted campaigns for low-sales months.
