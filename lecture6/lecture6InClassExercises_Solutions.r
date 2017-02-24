### Possible solutions to the in class exercises from lecture 6

### In Class Exercise:
# Use both seq() and rep() to generate the vector:
#  1 20 3 40 5 60 7 80 9 100  1 20 3 40 5 60 7 80 9 100

rep(seq(from = 1, to = 10, by = 1) * c(1, 10), 2)


### In-Class Exercise:
# Use the seq() command to generate a vector of every month-end date in 2010.

seq(as.Date("2010-02-01"), length = 12, by = "month") - 1


### In Class Exercise: 
# Using the labor data above, write code that calculates the percent change 
# in the unemployment level from month-to-month.  Call this column unlevelPercentChange.

# Initalize the data
labordata$unlevelPercentChange <- 0
# Set the condition
for(i in 2:nrow(labordata)) {
  # Run the code
  labordata$unlevelPercentChange[i] <- (labordata$unlevel[i] - labordata$unlevel[i - 1]) / labordata$unlevel[i - 1] * 100
}


### In Class Exercise:
# Use a while loop to find the greatest number 
# in the Fibonnaci sequence that is still less than 10000.
fib <- c(0, 1)
i = 2

while(max(fib) <= 10000) {
  fib <- c(fib, fib[i] + fib[i - 1])
  i <- i + 1
}

fib[length(fib) - 1]


### In-Class Exercise:
# Let's use if statements to examine GDP Data and find recessions.  In the file "gpddata", gdpc1 is the quarterly measure of real GDP, in chained 2009 dollars.

# Read in and format the data properly
gdpdata <- read.csv("gdpdata.csv")
gdpdata$date <- as.Date(gdpdata$date, format = "%m/%d/%Y")

# With the data read in, we're ready to find periods of recession.  
# The defintion of a recession is at least two consecutive quarters of negative GDP growth.
# Create a column called "recession" that has a
# value of TRUE during a recession, and FALSE otherwise.

# first we need the change in level, so we can see if there's negative growth in GDP.
# We can modify the code from above where we calculated change in labor data

gdpdata$levelChange <- 0
for(i in 2:nrow(gdpdata)) { 
  gdpdata$levelChange[i] <- gdpdata$gdpc1[i] - gdpdata$gdpc1[i - 1]
}

# Now we go row by row, and if there was a recession, we check one period 
# before to see if this is the second consecutive quarter of recession
gdpdata$recession <- FALSE
for(i in 2:nrow(gdpdata)) {
  if((gdpdata$levelChange[i] < 0) & (gdpdata$levelChange[i - 1] < 0)) {
    gdpdata$recession[i] <- TRUE
  }
}
  # The recession is declared after the fact, so the first quarter of 
  # negative growth is also part of that recession.  We need to check both up and down
for(i in 1:(nrow(gdpdata) - 1)) {
  if((gdpdata$levelChange[i] < 0) & (gdpdata$levelChange[i + 1] < 0)) {
    gdpdata$recession[i] <- TRUE
  }
}


### In Class Exercise:
# Convert the code above to take in a value, called "maxValue"
# and calculate the largest value of the fibonacci sequence less than that value.

maxFibonnaci <- function(maxValue) {
  fib = c(0, 1)
  i = 2
  
  while(max(fib) <= maxValue) {
    fib <- c(fib, fib[i] + fib[i - 1])
    i <- i + 1
  }
  
  return(fib[length(fib)- 1])
}

###In Class Exercise:
# Write a function that takes in a date (and only a date) and uses 
# If/else statements to return the quarter of the year that date 
# is in as a character, denoted Q1, Q2, Q3, or Q4.  The quarters are:
# Q1: Jan, Feb, Mar
# Q2: Apr, May, Jun
# Q3: Jul, Aug, Sep
# Q4: Oct, Nov, Dec
quarterConvert <- function(dateIn){
  monthIn <- format(dateIn, "%m")
  monthIn <- as.numeric(monthIn)
  
  quarterOut <- NA
  if(monthIn <= 3) {
    quarterOut <- "Q1"
  } else if(monthIn <= 6) {
    quarterOut <- "Q2"
  } else if(monthIn <= 9) {
    quarterOut <- "Q3"
  } else {
    quarterOut <- "Q4"
  }
  
  return(quarterOut)
  
}

### In Class Exercise:
# Use aggregate to give the nationwide total level of employment 
# for each date in the dataset.
usEmployment <- aggregate(stateEmployData$employ, by = list(stateEmployData$date), FUN = sum)
colnames(usEmployment) <- c("date", "totalUsEmployment")

## In Class Exercise:
# Using the "Quarter" function you wrote earlier, assign a Quarter value to the stateEmployData
# dataset (the unaggregated data).  
# Hint:  You may need a for loop to run the function over all the dates.  
# Once you have this set, use the new column and the aggregate command to create a dataset
# of average state-level employment by quarter.  
# Second hint:  You'll also need a "year" column to make this work.
# Bonus hint:  You can use paste to combine year and quarter to make this simpler
stateEmployData$quarter <- NA

for(i in 1:nrow(stateEmployData)) {
  stateEmployData$quarter[i] <- quarterConvert(stateEmployData$date[i])
}

stateEmployData$quarter <- paste(stateEmployData$quarter, format(stateEmployData$date, "%Y"))
quarterlyEmployment <- aggregate(stateEmployData$employ, 
                               by = list(stateEmployData$state, stateEmployData$quarter), 
                               FUN = mean)
colnames(quarterlyEmployment) <- c("state", "quarter", "meanEmployment")


######
#
# Good luck on your midterm!
######