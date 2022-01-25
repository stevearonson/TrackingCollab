library(tidyverse)
library(forecast)
library(zoo)

data <- read.csv("end0.csv")

#data$track_id <- ifelse(data$play_num == 0 & data$track_id == 35, 16, data$track_id)
#data$track_id <- ifelse(data$play_num == 0 & data$track_id == 33, 24, data$track_id)


data <- data %>%
  arrange(frame) %>% 
  group_by(play_num, id) %>% 
  mutate(x_10ra = rollapply(x1, 10, mean, partial = TRUE, align = 'right'),
         x_20ra = rollapply(x1, 20, mean, partial = TRUE, align = 'right'),
         x_30ra = rollapply(x1, 30, mean, partial = TRUE, align = 'right'),
         x_50ra = rollapply(x1, 50, mean, partial = TRUE, align = 'right'),
         y_10ra = rollapply(y1, 10, mean, partial = TRUE, align = 'right'),
         y_20ra = rollapply(y1, 20, mean, partial = TRUE, align = 'right'),
         y_30ra = rollapply(y1, 30, mean, partial = TRUE, align = 'right'),
         y_50ra = rollapply(y1, 50, mean, partial = TRUE, align = 'right'))


write.csv(data, "test.csv")


