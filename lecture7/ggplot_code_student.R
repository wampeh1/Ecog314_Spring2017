## Simeon Markind
## GGplot2 lecture 
## Code for following along with the presentation
## Delivered on March 10/17 2017


# SetUp -------------------------------------------------------------------

## Load your libraries
library(ggplot2)
library(dplyr)
library(readr)
library(purrr)
library(knitr)

theme_set(theme_gray())

## CHANGE THESE VARIABLES TO READ IN THE TREASURY DATA
treasuries <- read_csv("treasuries.csv")


# Base Line Graph ---------------------------------------------------------

#we will only graph the last 20 years
treasuries <- treasuries %>% 
    mutate(DATE = as.Date(DATE, format = "%Y-%m-%d"),
           GS1 = as.numeric(GS1),
           GS5 = as.numeric(GS5),
           GS10 = as.numeric(GS10),
           GS30 = as.numeric(GS30),
           UNRATE = as.numeric(UNRATE))

plot.data <- treasuries %>% 
    filter(DATE >= as.Date("1996-01-01")) %>% 
    select(DATE, GS1, GS5)

## Set up parameters for the basic plot

xaxis <- plot.data %>% select(DATE)
yaxis <- plot.data %>% select(GS1, GS5)

##base plot
plot(x = c(min(xaxis$DATE), max(xaxis$DATE)),
     y = c(min(yaxis), max(yaxis)),
     xlab = "Date",
     ylab = "Interest Rate",
     axes = T,
     type = "n")
lines(x = xaxis$DATE, y = plot.data$GS1, col = "green")
lines(x = xaxis$DATE, y = plot.data$GS5, col = "red")
mtext("One and Five Year Treasury Yields, 1996-2016", side = 3)
legend(x = "topright", horiz = F, 
       legend = c("One Year", "Five Year"),
       col = c("green", "red"),
       lty = c(1,1),
       title = "Tenor")


# GGplot Line Graph  ------------------------------------------------------

## We already have our data from the first plot we made using base plot
oneFiveTbill <- ggplot(data = plot.data, aes(x = DATE, y = GS1, 
                                             color = "One Year")) +
    geom_line() +
    geom_line(aes(x = DATE, y = GS5, colour = "Five Year")) +
    labs(title = "One and Five Year Treasury Yields, 1996-2016",
         x = "Date", y = "Interest Rate") +
    scale_color_manual("Tenor", values =  c("One Year" = "green",
                                            "Five Year" = "red"))

## Now that the plot is created, call it
oneFiveTbill


# Layering Example --------------------------------------------------------

## Run the code below for each layer and take a look at what each layer
## looks like, notice that we are able to build layers on top of previous ones

firstLayer <- ggplot(data = plot.data, 
                     aes(x = DATE, y = GS1, color = "One Year"))+
    geom_line()

firstLayer

secondLayer <- firstLayer +
    geom_line(aes(y = GS5, color = "Five Year"))
## We do not need to pass in an argument for the data to use or the 
## x axis since we already assigned those in first.layer
## If we wanted to use a different dataset we would need to specify 
## that directly in the geom_line command.

secondLayer

## Now that we plotted our data we should appropriately label our axes and title

thirdLayer <- secondLayer +
    labs(title = "One and Five Year Treasury Yields, 1996-2016",
         x = "Date", y = "Interest Rate") +
    scale_color_manual("Tenor", 
                       values =  c("One Year" = "green",
                                   "Five Year" = "red"))
thirdLayer


# In Class Exercise 1 ----------------------------------------------

plot.data <- 

first.layer <- 
    
second.layer <- first.layer +
    

inClass1 <- second.layer


# Scatter Data Setup -----------------------------------------------------

plot.data <- treasuries %>% 
    filter(DATE >= as.Date("2016-01-01")) %>% 
    select(DATE, GS1, GS10, GS5, GS3, GS30)

plot.data <- melt(plot.data, 
                  measure.vars = c("GS1", "GS10", "GS5", "GS3", "GS30"))


# Basic gg scatter --------------------------------------------------------

test2 <- tibble(x = plot.data[1:5, "DATE"],
                y = plot.data[1:5, "value"],
                color = rep("#FF6C91",5),
                shape = rep("19", 5),
                size = rep(1,5))

basic.scatter <- ggplot(test2, aes(x = x, 
                                   y = y, 
                                   color = color, 
                                   shape = shape, 
                                   size = size)) +
    geom_point()

basic.scatter


# Tbill Scatter -----------------------------------------------------------

scatter <- ggplot(plot.data, aes(x = DATE, y = value, group = variable))

scatter + geom_point(aes(shape = variable))
## Does this graph look good? What could we do instead to improve it? 
## Is changing shape for each group the most appropriate way to
## differentiate our data?

scatter + geom_point(aes(color = variable))


# In Class Exercise 2 -----------------------------------------------------

inClass2 <- ``
    
inClass2


# scale_y_continuous example ----------------------------------------------

scale_y_basic <- inClass2 +
    scale_y_continuous(name = "Interest Rate (%)")

scale_y_basic

## Now let's examine some of the intricate possibilities 
## for scale_y_continuous

scale_y_advanced <- ggplot(plot.data, aes(x = DATE, y = value, group = variable)) +
    geom_line(aes(linetype = variable, color = variable)) +
    geom_point(aes(color = variable)) +
    scale_y_continuous(name = "Interest Rate (%)",
                       breaks = seq(from = 0, to = 3, by = 0.5),
                       labels = c("0", "1/2", "1", "3/2", "2", "5/2", "3"),
                       limits = c(0,3))

scale_y_advanced


# In Class Exercise 4 -----------------------------------------------------

inClass4 <- 

inClass4

# Discrete Scale Example --------------------------------------------------

basic.boxplot <- ggplot(plot.data, aes(x = variable, y = value)) +
    geom_boxplot() +
    scale_x_discrete(name = "Security Tenor", 
                     labels = c("GS1" = "1 Year",
                                "GS3" = "3 Year",
                                "GS5" = "5 Year",
                                "GS10" = "10 Year",
                                "GS30" = "30 Year")) +
    ggtitle("Basic Boxplot of 2016 Treasuries")

basic.boxplot


# scale_color_hue example -------------------------------------------------

inClass5 <- inClass4 + 
    scale_color_hue(name = "Security Tenor", 
                    labels = c("GS1" = "1 Year",
                               "GS3" = "3 Year",
                               "GS5" = "5 Year",
                               "GS10" = "10 Year",
                               "GS30" = "30 Year"))
inClass5


# In Class Exercise 6 -----------------------------------------------------

inClass6 <- 
    
inClass6


# In Class Exercise 7 -----------------------------------------------------

inClass7 <- 

inClass7


# Title Alignmnet Example -------------------------------------------------

aligned.title <- inClass7 +
    theme(plot.title = element_text(face = "bold", 
                                    hjust = 0.5, #50% of chart width
                                    angle = 180,
                                    color = "orange"))

aligned.title


# In Class Exercise 8 -----------------------------------------------------

inClass8 <- 
    
inClass8


# Theme_bw example --------------------------------------------------------

theme.bw <- inClass7 + theme_bw()

theme.bw


# Theme Set Example 1 -----------------------------------------------------

theme_set(theme_dark())

inClass7


# Custom Theme Example ----------------------------------------------------

custom.theme <- theme_grey() + 
    theme(plot.title = element_text(size = 16, hjust = 0.5, face = "bold"),
          legend.title = element_text(size = 14, face = "italic", color = "blue"),
          axis.title.x = element_text(size = 12, color = "green"),
          axis.title.y = element_text(size = 12, color = "red"),
          plot.subtitle = element_text(hjust = 0.5))

theme_set(custom.theme)

inClass7


# In Class Exercise: Theme ------------------------------------------------

custom.theme2 <- 

theme_set(custom.theme2)

inClass7

theme_set(custom.theme)


# Multiple Sources Example ------------------------------------------------

## Getting the gdp data and formatting DATE column to be of same type as treasuries data
gdp <- read_csv(paste0(data.path, "gdp.csv"))
gdp <- gdp %>% mutate(DATE = as.Date(DATE, format = "%Y-%m-%d"))

## We will graph 20 years of treasury data again for the GS1 and GS5

treasury.plot.data <- melt(treasuries %>%
                               filter(DATE >= as.Date("1996-01-01")) %>% 
                               select(DATE, GS1, GS5),
                           id.vars = "DATE")

gdp.plot.data <- filter(gdp, DATE >= as.Date("1996-01-01"))

colnames(gdp.plot.data) <- c("QTR", "delGDP")

## first layer
multiple.sources <- ggplot(treasury.plot.data, aes(x = DATE, y = value,
                                                   color = variable)) +
    geom_line()

## add a layer
multiple.sources <- multiple.sources + geom_line(aes(x = QTR, y = delGDP,
                                                     color = "GDP"), 
                                                 data = gdp.plot.data)
## final version
multiple.sources + ggtitle("This plot shows data from two sources")

# Smoother Example --------------------------------------------------------

## This time we need to merge our data before plotting since we need a scatter plot instead of a time series

theme_set(theme_grey())

plot.data <- merge(treasuries %>% filter(DATE >= as.Date("1986-01-01")) %>% 
                       select(DATE, GS1, GS3),
                   gdp %>% filter(DATE >= as.Date("1986-01-01")),
                   by = "DATE", all.x = F, all.y = T)

## Go from wide to long
plot.data <- melt(plot.data %>% select(-DATE), measure.vars = c("GS1", "GS3"))

colnames(plot.data) <- c("GDP", "Tenor", "Yield")

inClass9 <- ggplot(plot.data, aes(x = GDP, y = Yield, group = Tenor)) +
    geom_point(aes(color = Tenor)) + 
    labs(x = "Quarterly GDP Growth")

inClass9 + geom_smooth(aes(group = Tenor, color = Tenor)) +
    ggtitle("One and Three Year Treasuries", 
            subtitle = "Default Loess Smoothing")

inClass9 + geom_smooth(aes(group = Tenor, color = Tenor), method = lm) +
    ggtitle("One and Three Year Treasuries",
            subtitle = "method = lm")

# Mapping US Cities -------------------------------------------------------

library(maps)

## Since AK and HI are far from the lower 48 we will not plot them
plot.data <- us.cities %>% filter(pop >= 100000,
                                  !(country.etc %in% c("AK", "HI")))

majorCities <- ggplot(plot.data, aes(x = long, y = lat, size = pop)) +
    geom_point(colour = alpha("black", 0.6)) +
    borders("state", colour = "red") +
    ggtitle("Cities over 100,000 in the USA") +
    scale_size_continuous(name = "Population")

majorCities
