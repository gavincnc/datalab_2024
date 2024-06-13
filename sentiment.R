library(ggplot2)
library(dplyr)
library(tidytext)
library(gsheet)
library(wordcloud2)
library(sentimentr)
library(lubridate)

survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')

# 4. Take a look at the first few rows of the data. What is the unit of observation?
#   
#   5. Create a variable named date_time in your survey data. This should be based on the Timestamp variable. Use the mdy_hms variable to created a “date-time” object.
new_survey <- survey %>%
  mutate(date_time = mdy_hms(Timestamp))


# 6. Create a visualization of the date_time variable.
ggplot(data = new_survey, aes(x = date_time)) +
  geom_histogram()
# 7. Create an object called sentiments by running the following:
sentiments <- get_sentiments('bing') 

#8. Explore the sentiments object. How many rows? How many columns? What is the unit of observation.

#6786 rows, 2 columns. Observing words and identifies them as having positive or negative connotations

#9. Create an object named words by running the following:
words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)

# 10. Explore words. What is the unit of observation.
# 
# 11. Look up the help documentation for the function wordcloud2. What does it expect as the first argument of the function?
#data(set) then size   
#   12. Create a dataframe named word_freq. This should be a dataframe which is conformant with the expectation of wordcloud2, showing how frequently each word appeared in our feelings.
word_freq <- words %>%
  group_by(word) %>%
  tally()
  
#data.frame(words$first_name, words$feeling_num, words$word)

# 13. Make a word cloud.
wordcloud2(word_freq, size = 2, minSize = 0, gridSize =  1,
           fontFamily = 'Segoe UI', fontWeight = 'bold',
           color = 'random-dark', backgroundColor = "white",
           minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
           rotateRatio = 0.4, shape = 'pentagon', ellipticity = 0.65)
# 14. Run the below to create an object named sw.
sw <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/stopwords.csv')

# 15. What is the sw object all about? Explore it a bit.
#List of safe? words
# 16. Remove from word_freq any rows in which the word appears in sw.
word_freq <- word_freq %>%
  filter(!word %in% sw$word)
# 17. Make a new word cloud.
wordcloud2(word_freq, size = 2, minSize = 0, gridSize =  1,
           fontFamily = 'Segoe UI', fontWeight = 'bold',
           color = 'random-dark', backgroundColor = "white",
           minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
           rotateRatio = 0.4, shape = 'pentagon', ellipticity = 0.65)
# 18. Make an object with the top 10 words used only. Name this object top10.
top10 <- word_freq %>%
  filter(n >= 4) %>%
  arrange(rank(desc(n)) <= 10) %>%
  


  
# 19. Create a bar chart showing the number of times the top10 words were used.
ggplot(data = top10, aes(x = n)) +
  geom_bar()
# 20. Run the below to join word_freq with sentiments.
# 
# 21. Now explore the data. What is going on?
#   
#   22. For the whole survey, were there more negative or positive sentiment words used?
#   
#   23. Create an object with the number of negative and positive words used for each person.
# 
# 24. In that object, create a new variabled named sentimentality, which is the number of positive words minus the number of negative words.
# 
# 25. Make a histogram of senitmentality
