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

girl_names <- bb_names %>%
  filter(name %in% c("Cindy", "Emma", "Selwyn", "Sally", "Sarah"), sex == "F")


ggplot(data = girl_names %>% filter(year == "2002"), aes(x = name, y = n,)) +
  geom_col()
# 14) Make the bars transparent and filled with the color blue.

ggplot(data = girl_names %>% filter(year == "2002"), aes(x = name, y = n)) +
  geom_col(alpha = .5, fill = "lightblue") +
  labs(x = "Name", y = "occurances")

# 15) Create a new data set called the_nineties that only contains years from the 1990s.
the_nineties <- bb_names %>%
  filter(year >= 1990, year <= 1999)

# 16) Save this dataset to your repository (use write.csv()).
write.csv(the_nineties, "datalab_2024.rproj")
# 17) Add, commit, and push your files to GitHub.

#19) Now that everything is up to date, make a visualisation of you and your team member’s names for a year of your choice.
ggplot(data = bb_names %>% filter(name %in% c("Gavin", "Kyle", "Joseph"), year == 2005), aes(x = name, y = n)) +
  geom_col(fill = "darkolivegreen")
#20) Make a visual that looks at your name over time. What happens if you color by sex?
ggplot(data = bb_names %>% filter(name == "Gavin"), aes(x = year, y = n, col = sex)) +
  geom_line(fill = "darkblue", size = 1.2)
