# Exploratory Analysis Exercise
#
# What automotive features were good predictors of quarter mile time in 1974?
# 
# INSTRUCTIONS: complete the program below. You will need to make choices about 
# how to use the data, and fix several bugs (many are marked with ???). 
# Look for The comments in the code with the prompt "PROBLEM 1", 2, 3, etc. 
# these comments will provide additional instructions. Share your progress 
# by posting the .R file to piazza alomgm with hw4 and share it with instructors
#
# Created <when> by <who>
#-------------------------------------------------------------------------------

#------------------
# Get Data
#------------------

# PROBLEM 1: wrong url
# replace it with https://raw.githubusercontent.com/wampeh1/Ecog314_Spring2017/master/lecture4/data/mtcars.csv
# and download the data

data_url <- "https://github.com/wampeh1/Ecog314_Spring2017/tree/master/lecture4/data/mtcars.csv"

if ( ! file.exists("mtcars.csv") | file.info("mtcars.csv")$size == 0 ) {
    download.file(data_url, "mtcars.csv")
}


#------------------
# Import Data
#------------------

mtcars <- read.csv("data/mtcars.csv", stringsAsFactors = FALSE)

str(mtcars)
head(mtcars)

# inspect make and model
unique(mtcars$mm)


#-----------------
# Tidy & Transform
#-----------------

# PROBLEM 2: The new power to weight ratio variable was not calculated
# Fix the assignment below using variables from the mtcars data frame
# Compute power to weight ratio (fix the code below)

mtcars$power_weight_ratio <- hp / wt



# Identify imported/domestic cars (fix the code below)

import_makes <- c("Mazda", "Datsun", "Merc", "Fiat", "Honda", 
                  "Toyota", "Lotus", "Porsche", "Ferrari", "Maserati", 
                  "Volvo")

# PROBLEM 3: Loop to calssify import/domestic doesn't work
# Fill in the ??? to create a loop that correctly assigns a label
# to imported cars

for ( make in import_makes ) {
    print(paste("looking for:", make))
    
    has_matching_make <- grepl(make, mtcars$mm)
    
    print(paste("found:", mtcars[has_matching_make, "mm"]))
    
    mtcars[???, "origin"] <- "imported"
}

mtcars[mtcars$origin != "imported", "origin"] <- "domestic")



#-----------------
# Summarize
#-----------------

# PROBLEM 4: Summary isn't using the new variable, output is hard to read.
# Change the aggregation to use the new "origin" variable
# Assign the result of aggregate to a data frame, and give the 
# columns names using the names() function or an alternative.
# Lastly print the summary
 
aggregate(mtcars$qsec,
          by = list(mtcars$gear),
          mean) 

names(???) <- c(???)
print(???)


#-----------------
# Visualize
#-----------------

# PROBLEM 5: Fill in the blank (???) and spelling errors
# Several of the plots below don't work. Make minimal changes to 
# fix them

histergram(mtcars$qsec, xlab = "Quarter-Mile Time (seconds)")


boxplot(qsec ~ ???, data = mtcars, main = "Quarter-Mile Time by ??? group")


plot(wt, qsec, 
     xlab = "Weight (1000 lbs)", 
     ylab = "Quarter-Mile Time (seconds)")
 

plot_data <- subset(mtcars, select = c("qsec", "mpg", "hp", "???"))

pairs(plot_data) 
# a new plot style!



# PROBLEM 6: Create an additional plot. If you need to, create more variables 
#
#



#-----------------
# Output files
#-----------------


# PROBLEM 7: Share your work.
# Output your data to a csv file
# Save your best plot to a file
# Specify where the output should go

# Save the data you created
write.csv(mtcars, file = ???)


# Save a plot image
png(filename = ???)
hist(mtcars$qsec)
dev.off()


