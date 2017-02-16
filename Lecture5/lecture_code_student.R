## Code for Dplyr Presentation
## Simeon Markind
## 2/16/2017
## FRB-Howard Expository Data Analysis ECON 314
## Instructor Version

## Discuss Packages and load in Dplyr
library(dplyr)

## Load in the flight data
library(nycflights13)

## Take a look at the flights data
nycflights13::flights

###########################
## Print out the names of the columns and 
## see how many rows and columns the tibble has
###########################


#############
# Select Example 1
############

## We select columns in Base R by quoting the column names
baseR <- flights[, c("year", "month", "day", "sched_dep_time", "sched_arr_time")]

## Using the Dplyr select function we do not need to quote the column names
flight_cols <- select(flights, year, month, day, sched_dep_time, sched_arr_time)

dim(flight_cols)
head(flight_cols)
identical(flight_cols, baseR)
######################

####################
# Deselect Example
####################

deselect <- select(flights, -carrier, -tailnum)

dim(deselect)
head(deselect)
#######################

#################
# InClass Exercise 1
#################

inClass1 <- 

###################

###################
# Filter Example 1
###################

## We will filter based on the month values in the flights data. 
## First let's take a look at the different values for the month variable 
## in the table.

unique(flights$month)

#Let's first filter down to only the flights that occurred in January (month == 1)

Jan <- filter(flights, month == 1)

nrow(Jan)
# Use the nrow function to get the number of rows in a data frame.
# We filtered out most of the rows in the flights data

ncol(Jan)
# Use the ncol function to get the number of columns in a data frame.
# notice that we did not select any columns when we created Jan, 
# so we therefore have all the columns the original flights data came with

unique(Jan$month)

# there is only one possible value of month in the table, 
# which we would expect since we filtered based on the month value.

################################

#################
# Multiple Filter
################
multiple_filter <- filter(flights, day > 10, dep_delay <= 5, !is.na(arr_time))

dim(multiple_filter)
head(multiple_filter)
####################

###################
# In Class Exercise 3
##################
inClass3 <- 

head(inClass3)
#######################

###################
# Filtering with OR
##################
filter1 <- filter(flights, day == 1 | day == 2, month == 12 | month == 11)

head(filter1)

###########################

#####################
# Filter with %in%
#####################
inEx <- c(1:5)
inEx %in% c(2,4)

## Now we use %in% to recreate the filter example from above
filter2 <- filter(flights, day %in% c(1,2), month %in% c(11,12))
############################

####################
# Filtering with &
##################
filter3 <- filter(flights, (day == 1 | day == 2) & (month == 11 | month == 12))

## We use the identical function to check that they are all the same output:

identical(filter1, filter2)
identical(filter1, filter3)
##############################

#########################
# In Class exercise 4
#########################
inClass4 <- 
    
head(inClass4)
#################################

#####################
# Arrange Example 1
##########################
head(flights)

arrEx1 <- arrange(flights, dep_time, sched_dep_time, arr_time)

head(arrEx1)
#################################

#################
# In Class exercise 5
################
inClass5 <- 

inClass5
###################

###################
# Descending Arrange Example
######################
arrEx2 <- arrange(flights, desc(dep_time), -sched_dep_time, arr_time)

#####################

####################
# Mutate Example 1
####################

## Since mutate adds columns to the end of the data we will select only a few
## columns so that we can see our additional columns
mData <- select(flights, sched_arr_time, arr_time, arr_delay, dep_delay, air_time)

mData <- mutate(mData, 
                overshoot = arr_time - sched_arr_time, 
                hours = air_time / 60,
                gain = dep_delay - arr_delay, #time made up in the air
                gain_per_hour = gain/hours) 

mData
names(mData)
############################

############################
# Mutate Example 2
###########################

# First I'm going to select our columns and overwrite the mData data frame
mData <- select(flights, year, month, day, air_time)

mData2 <- mutate(mdata, air_time = air_time/60, #update existing variable
                 Quarter = ifelse(month %in% c(1,2,3), "Q1", "Q"), #create new var
                 Quarter = ifelse(month %in% c(4,5,6), "Q2", Quarter), #update var
                 Quarter = ifelse(month %in% c(7,8,9), "Q3", Quarter),
                 Quarter = ifelse(month %in% c(10,11,12), "Q4", Quarter))

head(mData2)
#################################

#############################
# In Class Exercise 6
###########################
inClass6 <- 
inClass6 <- 
    
inClass6
############################

#########################
# Summarize Example 1
##########################
summ <- summarise(flights, avg_dep_delay = mean(dep_delay, na.rm = T),
                  avg_arr_delay = mean(arr_delay, na.rm = T),
                  avg_gain = mean(arr_delay - dep_delay, na.rm = T))

summ
#########################

##########################
# In Class Exercise 7
###########################
inClass7 <- 
    
inClass7
###########################

####################
# Example without Pipes
#####################
df <- select(flights, year, month, day, arr_delay, dep_delay, air_time)
df <- filter(df, month > 6, day < 5, !is.na(arr_delay))
df <- summarise(df, avg_arr_delay = mean(arr_delay, na.rm = TRUE),
                avg_dep_delay = mean(dep_delay, na.rm = TRUE))
df
######################

########################
# Example with Pipes
##########################
df2 <- flights %>% 
    select(., year, month, day, arr_delay, dep_delay, air_time) %>%
    filter(., month > 6, day < 5, !is.na(arr_delay)) %>%
    summarise(., avg_arr_delay = mean(arr_delay, na.rm = TRUE),
              avg_dep_delay = mean(dep_delay, na.rm = TRUE))

df2

df2 == df
##########################

#########################
# Example without Dots
###########################
df3 <- flights %>% 
    select(year, month, day, arr_delay, dep_delay, air_time) %>%
    filter(month > 6, day < 5, !is.na(arr_delay)) %>%
    summarise(avg_arr_delay = mean(arr_delay, na.rm = TRUE),
              avg_dep_delay = mean(dep_delay, na.rm = TRUE))

df3

df2 == df3
############################

##########################
# Indecipherable Example
#########################
df4 <- summarise(
            filter(
                select(
                    flights, 
                    year, month, day, arr_delay, dep_delay, air_time),
                month > 6, day < 5, !is.na(arr_delay)),
            avg_arr_delay = mean(arr_delay, na.rm = TRUE),
            avg_dep_delay = mean(dep_delay, na.rm = TRUE)
        )

df4 == df3
##############################

############################
# Group By No Summary
##########################
## As you can see, if you run the group_by function by itself, even with argument, there is no change to your underlying data frame

group_by(flights, month)

## Notice that now at the top of the tibble we have the information about "Groups:"
#########################

############################
# Group By Example
##########################
flights %>%
    group_by(origin) %>%
    summarise(flight_count = n(), # the n() function gives you the group's count
              avg_arr_delay = mean(arr_delay, na.rm = T),
              avg_dep_delay = mean(dep_delay, na.rm = T))
#########################

#########################
# In Class Exercise 8
########################
inClass8 <- 

inClass8
#######################

######################
# Group_by Example 3
########################
flights %>% 
    mutate(., gains = arr_delay - dep_delay) %>% 
    filter(., !is.na(gains)) %>% 
    group_by(., carrier, dest) %>% 
    summarise(., avg_gains = mean(gains),
              sd_gains = sd(gains),
              count = n()) %>% 
    arrange(., dest, -count, carrier)
##########################

##########################
# Pipe Assignment
##########################
avg_gains <- flights %>% 
    mutate(., gains = arr_delay - dep_delay) %>% 
    filter(., !is.na(gains)) %>% 
    group_by(., carrier, dest) %>% 
    summarise(., avg_gains = mean(gains),
              sd_gains = sd(gains),
              count = n()) %>% 
    arrange(., dest, -count, carrier)

print(head(avg_gains))
############################

######################
# Weather Overview
#####################
names(weather)

dim(weather)

head(weather)
######################

##########################
# Left Join Example
########################
## Take a sample of the flights data and join to some of the weather data.

samplef <- flights %>% 
    filter(., !is.na(dest), !is.na(air_time))%>% 
    select(., origin, year, month, day, hour, dest, air_time)

samplew <- weather %>%
    select(., origin, year, month, day, hour, temp, wind_dir) 

head(samplew)

join <- left_join(samplef, samplew, by = c("origin", "year", "month", "day", "hour"))

nrow(samplef)
nrow(samplew)
nrow(join)

head(join)
##########################

########################
# Wind Speed Delay Example
#######################
## Here you can see how the pipe operator can really make the code flow easy to understand

wind_speed <- flights %>% 
    filter(., !is.na(dep_delay)) %>% 
    group_by(., origin, year, month, day, hour) %>% 
    summarise(., avg_dep_delay = round(mean(dep_delay),1)) %>% 
    left_join(.,
              weather %>% 
                  filter(., !is.na(wind_speed)) %>% 
                  select(., origin, year, month, day, hour, wind_speed) %>% 
                  mutate(., wind_speed = round(wind_speed, 0)),
              by = c("origin", "year", "month", "day", "hour")) %>%
    group_by(., wind_speed) %>% 
    summarise(., delay = round(mean(avg_dep_delay, na.rm = T),2)) %>% 
    arrange(., wind_speed) 

wind_speed
##########################

#########################
# Cor of Wind Speed and Delays
############################
cor(wind_speed$wind_speed, wind_speed$delay, use = "complete.obs")
##########################

#########################
# Cleanup
#########################
rm(arrEx1, arrEx2, avg_gains, baseR, deselect, df, df2, filter1, filter2, filter3,
   flight_cols, inClass1, inClass3, inClass4, inClass5, inClass6, inClass7,
   inClass8, Jan, join, mdata, multiple_filter, samplef, samplew, wind_speed, inEx)
##########################

## END OF SCRIPT