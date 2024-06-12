library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyverse)

climate <- read.csv("sewanee_weather.csv")

climate <- climate %>%
  mutate(DATE = ymd(DATE))

#Creates columns for just the day, month, and year to ease graphing
climate <- climate %>%
  mutate(year = year(DATE)) %>%
  mutate(month = month(DATE)) %>%
  mutate(day = day(DATE))


#Line graph of the max temp for every day since 2000
ggplot(data = climate, aes(x = DATE, y = TMAX)) +
  geom_line()

#Displays max and min temp over the course of 2023
ggplot(data = climate %>% filter(year == 2023)) +
  geom_line(aes(x = DATE, y = TMAX), col = "lightblue", size = 1.1, alpha = .8) +
  geom_line(aes(x = DATE, y = TMIN), col = "darkgreen", size = 1.1, alpha = .8) #+ 
  #geom_ribbon(aes(x = DATE, ymin = TMIN, ymax = TMAX, alpha = .5))

ggplot(data = climate %>% filter(year == 2023), aes(x = DATE, ymin = TMIN, ymax = TMAX)) +
  geom_ribbon() +
  theme_bw()

#Creates a dataset that calculates average monthly precipitation
test <- climate %>%
  #filter(year > 2000 & year < 2005) %>%
  group_by(month, year) %>%
  summarize(monthlyPRCP = mean(PRCP, na.rm = TRUE))
  #select(PRCP, year, month, day) %>%
  #mutate(AVG_PRCP = mean(PRCP))

#Dot plot of the average monthly precipitation
ggplot(data = test %>% filter(year > 2000 & year < 2005)) +
  geom_point(aes(x = month, y = monthlyPRCP, col = year), size = 2)

#Other Code




