1:10

seq(from = 1, to = 10)

rep(x = 1, times = 10)

rep(x = c(1, 2, 3), times = 10)

seq(from = 0, to = 100, by = 10)

seq(from = 0, length = 11, by = 10)

seq(from = 10, to = 100, by = 10) + 5
seq(from = 10, to = 100, by = 10) * 3.5
seq(from = 10, to = 100, by = 10)[c(2, 4, 6)]

dates <- c(as.Date("2010-01-01"), as.Date("2010-12-31"))

print(dates)
mean(dates)
min(dates)
max(dates)
as.Date("2010-02-10") + 10

as.Date("1980-02-10")

as.Date("19800210", format = "%Y%m%d")

as.Date("10Feb80", format = "%d%b%y")

as.Date("9/18/2016", format = "%m/%d/%Y")

Sys.Date()
format(Sys.Date(), "%d %B %Y")
format(Sys.Date(), "%d-%b")
format(Sys.Date(), "%Y")

paste0("carsDataSet_", format(Sys.Date(), "%Y%m%d"), ".csv")

# From Windows Excel
as.Date(30829, origin = "1899-12-30")

# From iOS Excel
as.Date(29367, origin = "1904-01-01")
dates <- seq(as.Date("2015-01-01"), to = as.Date("2015-12-31"), by = "month")
print(dates)
mean(dates)
min(dates)
max(dates)

fib <- c(0, 1)
fib <- c(fib, fib[2] + fib[1])
fib <- c(fib, fib[3] + fib[2])
fib <- c(fib, fib[4] + fib[3])
fib <- c(fib, fib[5] + fib[4])
fib <- c(fib, fib[6] + fib[5])
fib <- c(fib, fib[7] + fib[6])
fib <- c(fib, fib[8] + fib[7])
fib <- c(fib, fib[9] + fib[8])
print(fib)

# Initalize the data
fib <- c(0, 1)

# Set up the condition
for(i in 2:9) {
  
  # The function itself
  nextFib <- fib[i] + fib[i - 1]
  fib <- c(fib, nextFib)
}
print(fib)

labordata <- read.csv("labordata.csv", stringsAsFactors = FALSE)
head(labordata)

# fix the date
labordata$date <- as.Date(labordata$date, format = "%m/%d/%Y")
nrow(labordata)

# Initalize the data
labordata$unlevelChange <- 0
# Set the condition
for(i in 2:nrow(labordata)) {
  # Run the code
  labordata$unlevelChange[i] <- labordata$unlevel[i] - labordata$unlevel[i - 1]
}

plot(labordata$date, labordata$unlevelChange, type = 'l')
abline(h = 0, col = "firebrick")

# Initalize the data
fib <- c(0, 1)
i = 2

while(length(fib) <= 10) {
  fib <- c(fib, fib[i] + fib[i - 1])
  i <- i + 1
}

print(fib)

# Initalize the data
labordata$health <- NA

for(i in 1:nrow(labordata)){
  if(labordata$unlevelChange[i] < 0) {
    labordata$health[i] <- "HEALTHY!"
  } else if(labordata$unlevelChange[i] >= 0) {
    labordata$health[i] <- "WARNING!"
  }
}

head(labordata, 10)

labordata$health <- NA

for(i in 1:nrow(labordata)){
  if(labordata$unlevelChange[i] < 0) {
    labordata$health[i] <- "HEALTHY!"
  } else if(labordata$unlevelChange[i] > 0) {
    labordata$health[i] <- "WARNING!"
  } else {
    labordata$health[i] <- "NEUTRAL"
  }
}

head(labordata, 15)

# Finds the first 10 terms of the fibonnaci sequence
fibonnaci <- function(terms) {
  fib = c(0, 1)
  i = 2
  
  while(length(fib) < terms) {
    fib <- c(fib, fib[i] + fib[i - 1])
    i <- i + 1
  }
  
  return(fib)
}

fibonnaci(terms = 10)

fibonnaci(terms = 15)

fibonnaci <- function(terms = 2) {
  if(!is.numeric(terms)) {
    stop("Please enter a numeric value")
  }
  if(round(terms) != terms) {
    stop("Please enter a whole number")
  }    
  if(terms <= 0) {
    stop("Please enter a positive value")
  }
  fib = c(0, 1)
  i = 2
  
  while(length(fib) < terms) {
    fib <- c(fib, fib[i] + fib[i - 1])
    i <- i + 1
  }
  
  return(fib)
  
}

fibonnaci(terms = "A")

fibonnaci(terms = 1.10)

fibonnaci(terms = -10)

fibonnaci(terms = 10)

akna <- read.csv("stateData/AKNA.csv", stringsAsFactors = FALSE)
head(akna)

stateEmployFiles<- list.files("stateData/")
stateEmployFiles

stateEmployFiles <- list.files("stateData/", full.names = TRUE)
stateEmployFiles

stateEmployData <- read.csv(stateEmployFiles[1])

head(stateEmployData)
nrow(stateEmployData)

stateEmployData$state <- names(stateEmployData[2])
colnames(stateEmployData) <- c("date", "employ", "state")

for(i in 2:length(stateEmployFiles)) {
  tempData <- read.csv(stateEmployFiles[i], stringsAsFactors = FALSE)
  tempData$state <- names(tempData[2])
  colnames(tempData) <- c("date", "employ", "state")
  
  stateEmployData <- rbind(stateEmployData, tempData)
}
nrow(stateEmployData)


states <- unique(stateEmployData$state)
stateMeans <- data.frame(state = states[1], meanEmploy = mean(stateEmployData$employ[stateEmployData$state == states[1]]))

for(i in 2:length(states)) {
  tempStateMean = data.frame(state = states[i], meanEmploy = mean(stateEmployData$employ[stateEmployData$state == states[i]]))
  
  stateMeans <- rbind(stateMeans, tempStateMean)
}
head(stateMeans)


stateMeansAggregate <- aggregate(x = stateEmployData$employ, 
                                 by = list(stateEmployData$state), 
                                 FUN = mean)
colnames(stateMeansAggregate) <- c("state", "meanEmploy")

head(stateMeansAggregate)