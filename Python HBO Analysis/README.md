# HBO Movies and Shows Analysis

## Description
A statistical analysis of HBO's content exploring factors that influence IMDB scores for movies and shows. This project employs regression modeling with feature engineering to identify key predictors of IMDB ratings and provides an interpretation and comparison of results between movies and shows.

## Main Goals
The analysis addresses the following research objectives:
- Explore and visualize the data to identify top genres and production countries for movies and shows.
- Determine key factors influencing movie and show IMDB scores through regression analysis.
- Incorporate actor and director features to improve model performance.
- Compare the influencing factors between movies and shows.

## Statistical testing details
Base Movie and Show Models:
- For both models, the hypotheses are: Null hypothesis (H₀): None of the predictors have a statistically significant effect on IMDB scores. Alternative hypothesis (H₁): At least one predictor has a statistically significant effect on IMDB scores.
- Models were checked for multicollinearity and heteroscedasticity (Breusch-Pagan test): predictors were standardized, and robust standard errors were used in the movie regression model.
- Ordinary Least Squares (OLS) Regression was used for shows, and OLS Regression with robust standard errors was used for movies. 

New Models (with Actor/Director Features):
- The original dataset was merged with data containing information about actors and directors. Directors were only added to movies, since the vast majority of shows do not have information about directors.
- Feature engineering was applied:
  1. Bayesian ranking: Created actor/director tiers accounting for both average IMDB scores and the number of projects to reduce the impact of people with high scores but only 1-2 projects.
  2. Project-Level Aggregation Features: Created features for the number of actors and directors, the percentage distribution of actor/director tiers, and an indicator for the presence of any top-tier actors/directors.
- Models were checked for multicollinearity and heteroscedasticity (Breusch-Pagan test): predictors were standardized, and robust standard errors were used.
- OLS Regression with robust standard errors was used for both new models.

## Tools Used
- Python (numpy, pandas, matplotlib, seaborn, scipy, statsmodels, sklearn)

## Results Interpretation
Several key insights were identified:
- Drama and Comedy genres dominate both movies and shows.
- The US is the clear leader in production for both movies and shows, followed with a significant drop by Great Britain.

Base Models:
- The Base Movie Regression Model explains 26.7% of the variation in IMDB scores. Newer movies receive lower scores and longer movies score higher. Animation, documentation, drama and historical genres score higher, while action, comedy, horror, romance, and sport genres score lower. Documentaries provide the highest positive boost to scores among all genres, while horrors have the most negative impact. As for production countries, the USA and Canada both have negative effects on scores, while France has a positive effect. 
- The Base Show Regression Model explains 13% of IMDB score variation. Newer shows receive lower scores just like movies, longer runtime has a positive effect, and shows with more seasons score higher. Drama and history genres score higher, while the family genre has a negative effect. History genre has the strongest positive effect in the model, and family genre has the strongest negative effect. Production countries for shows were statistically insignificant.

New Models (with Actor/Director Features):
- The new Movie Regression Model explains significantly more variance (55%). Newer movies still receive lower scores and longer movies receive higher scores, however these effects are not as strong. Documentaries remain the highest positive genre, while action is now the most negative genre, with horrors in second place. The USA is the only significant production country (negative effect). Actor and director variables are strongly significant: a higher number of actors slightly boosts scores; top-tier and second-tier actors, as well as top-tier directors, improve ratings. The presence of at least one top-tier actor helps ratings, while low-tier actors and directors hurt ratings. Top-tier and low-tier actors are now the highest positive and negative predictors in the model instead of genres.
- The new Show Regression Model explains 47.8% of IMDB score variation. Newer shows still receive lower scores, shows with longer runtime receive higher scores, but the number of seasons became statistically insignificant. Drama and history genres became statistically insignificant, while fantasy became significant in its positive effect on scores. Family genre remained strongly significant, having a negative effect on ratings. US production became significant with a negative effect. Low-tier actors strongly reduce scores, and top-tier actors greatly increase them, making them the most influential predictors.

Key Comparisons:
- For shows, star power is more impactful on scores: top-tier actors have double the positive impact on shows compared to movies. Low-tier actors hurt both, but the effect is more pronounced for shows. Second-tier actors are significant for movies but not for shows. Cast size matters for movies but is insignificant for shows.
- Longer runtime helps both movies and shows, and newer releases score lower for both. 
- Movies benefit more from dramas and documentaries, while shows from fantasy. Movies suffer from action, comedy, horror and romance, while shows from family genres.
- US production hurts both movie and show scores.

## Future Use
This analysis in Python provides valuable insights into the factors influencing IMDB scores for movies and shows presented on HBO platform. The results can be used for predicting IMDB scores, informing strategic content planning, and improving the model by incorporating new features.
