#Loads a library containing baby names
library(babynames)
library(ggplot2)
library(tidyverse)

#Creates a dataset called bb_names of all babynames
bb_names <- babynames


#Name marie has declined since 1982, with spikes every few years
ggplot(data = bb_names %>% filter(name == "Marie", year >= 1982), aes(x = year)) +
  geom_histogram()

# 11) Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.
ggplot(data = bb_names %>% filter(name == "Joe"), aes(x = year, y = prop, col = sex)) +
  geom_line(alpha = .5, size = 3)
# 12) Add new x and y axis labels, as well as a chart title.
ggplot(data = bb_names %>% filter(name == "Joe"), aes(x = year, y = prop, col = sex)) +
  geom_line(alpha = .5, size = 3) +
  labs(x = "Year", y = "Proportion of all children", title = "Proportion of children name Joe overtime sorted by sex", col = "Sex")
# 13) Create a bar chart of all female names in 2002.
ggplot(data = bb_names %>% filter(sex == "F", year == "2002"), aes(x = year)) +
  geom_bar()
# 14) Make the bars transparent and filled with the color blue.
ggplot(data = bb_names %>% filter(sex == "F", year == "2002"), aes(x = year)) +
  geom_bar(alpha = .3, fill = "lightblue")
# 15) Create a new data set called the_nineties that only contains years from the 1990s.
the_nineties <- bb_names %>%
  filter(year >= 1990, year <= 1999)


# 16) Save this dataset to your repository (use write.csv()).
write.csv(the_nineties, "datalab_2024.rproj")
# 17) Add, commit, and push your files to GitHub.

                   
                   
