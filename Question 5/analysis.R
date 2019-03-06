setwd("~/github/random_analysis/Question 5")
library(tidyverse)
library(rvest)


rogue_sl_2017 <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21894&mkId=20077&page=1&perPage=100&rd=50&searchSource=PAGINATION&shippable-dealers-checkbox=true&showMore=false&sort=relevance&trId=24880&yrId=30031936&zc=91605&localVehicles=false")
prices <- rogue_sl_2017 %>% html_nodes("span.listing-row__price") %>% html_text()
mileage <- rogue_sl_2017 %>% html_nodes("span.listing-row__mileage") %>% html_text()

prices <- prices %>% str_replace_all("\n", "") %>% str_replace_all(" ", "") %>% str_replace_all("\\$", "") %>% str_replace_all(",", "") %>% as.numeric()

mileage <- mileage %>% str_replace_all(" ", "") %>% str_replace_all("\n", "") %>% str_replace_all("mi.", "") %>% str_replace_all(",", "") %>% as.numeric()

summary(prices)

summary(mileage)

df <- data_frame(prices, mileage)

df %>% ggplot(aes(y = prices, x = mileage)) + 
        geom_point() + 
        geom_smooth(method="lm") + 
        geom_vline(xintercept = 28000, color = "red") +
        scale_y_continuous(breaks=seq(0,(max(prices)+500),500)) +
        labs(title = "Cars.com 2017 Nissan Rogue within 50 miles of 91605") 
        

ggsave("prices-mileage.png", width = 6, height = 6)
