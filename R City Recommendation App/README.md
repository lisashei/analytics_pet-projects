# European City Recommendation App

## Description
A web application that provides European city recommendations for tourists based on their budget, personal preferences, and travel style.

## Main Goals
- Group cities into clusters based on feature similarities
- Provide users with optimized city suggestions based on individual travel preferences and budget
- Introduce travelers to cities they might not have considered but would enjoy based on their preferences

## Interface Overview
User enters:
- Trip duration  
- Total budget in euros  
- Accommodation preference (select suitable option: Hostel, 2-star hotel, 3-star hotel, 4-star hotel, 5-star hotel, 1-bedroom apartment in city center, 1-bedroom apartment in outskirts)  
- Dining preference (select suitable option: Fast-food restaurants, Mid-range restaurants, Upscale restaurants)  
- Need for public transportation (yes/no)  
- Vacation type preferences (select yes/no for each: Cultural vacation, Shopping, Beach vacation, Outdoor activities, Active sports)  
- Portion of the budget to be spent on selected vacation types and unexpected expenses  

User gets:
- Main table with top-3 recommended cities that best match all criteria, sorted by affordability
- "You might also like" table section with cities from the same cluster

## Technical Details
- Machine learning was used to cluster cities based on their similarity (k-means) in order to additionally suggest cities from the same cluster as the top-3 recommended cities.
- Cities were selected through if/else filtering, which chose relevant variables in the "Accommodation”, "Food," and "Transport" categories based on user choices.
- A new variable "total" was created: the sum of values from selected variables was multiplied by the number of days entered by the user, and added to the user's chosen budget amount allocated for selected vacation types and unexpected expenses.
- Cities were filtered based on the “total” variable to ensure it was less than the budget entered by the user.
- Cities were also filtered based on the types of tourism selected by the user.

## Tools Used
- R (dplyr, shiny, caret) 

## Results Interpretation
- Cities are grouped into 5 distinct clusters based on similarity patterns
- Top-3 cities are selected based on budget fit and preference matching
- Additional recommendations are provided that come from the same cluster as top choices, ensuring similar characteristics and experiences

## Future Use
This app is a valuable tool for travelers that can save research time and help discover new destinations. It can also provide insights into traveler preferences, which is useful for tourism businesses. The application can be improved by expanding the city database and their features, connecting to live API feeds for real-time pricing information, and adding interactive visualizations.
