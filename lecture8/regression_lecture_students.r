#install.packages("Lahman")
library(Lahman)
library(dplyr)
library(ggplot2)

# load data from package Lahman


# make subsets of some of the data
teams_small <- Teams %>%
               mutate() %>%
               select()

batting_small <- Batting %>%
                 mutate() %>%
                 select()


# join all the data together
baseball_data <- left_join() %>%
                 left_join() %>%
                 na.omit()

# what are the dimensions of the combined data           
dim()

# simple scatterplots
p_salary_vs_ba <- 

p_salary_vs_hr <- 

# basic model
basic_model <- lm()

str(basic_model)

summary(basic_model)

baseball_data_residuals <- baseball_data %>%
                           mutate(residuals = )

# box plot of residuals
p_box_res_year <-

p_box_res_team <-
  
# model with fixed effects for years
fancy_model <- lm()

summary(fancy_model)

# histogram of salary variable

# model with log salary
super_fancy_model <- lm()

summary(super_fancy_model)

# birth weights
ezpass_birthweights <- read.csv()

str(ezpass_birthweights)

ezpass_reg_data <- ezpass_birthweights %>%
                   mutate()

ezpass_reg = lm()

summary(ezpass_reg)
