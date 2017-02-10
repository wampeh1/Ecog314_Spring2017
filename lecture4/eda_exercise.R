# Exploratory Analysis
#
# What automotive features were good predictors of quarter mile time in 1974?
# 
# INSTRUCTIONS: complete the program below. You will need to make choices about 
# what data to use, and fix several bugs... 
#
# Created <when> by <who>
#-------------------------------------------------------------------------------

# Set Working Directory

setwd(???) # use the code here, or delete this line and use the menu

#------------------
# Get Data
#------------------

# it's good to document your sources

data_url <- "https://github.com/wampeh1/Ecog314_Spring2017/tree/master/lecture4/data/mtcars.csv"

if ( ! file.exists("mtcars.csv") ) {
    download.file(data_url, "mtcars.csv")
}


#------------------
# Import Data
#------------------

mtcars <- read.csv("mtcars.csv", stringsAsFactors = FALSE)
str(mtcars)
head(mtcars)


#-----------------
# Tidy & Transform
#-----------------

# Create a variable with the make & model
mtcars$make_and_model <- rownames(mtcars)

# Compute power to weight ratio (fix the code below)
mtcars??? <- hp / wt            


# Identify imported/domestic cars (fix the code below)

import_makes <- c("Mazda", "Datsun", "Merc", "Fiat", "Honda", 
                  "Toyota", "Lotus", "Porsche", "Ferrari", "Maserati", 
                  "Volvo")

for ( make in import_makes ) {
    has_matching_make <- grepl(make, make_and_model)
    mtcars[i ???, "origin"] <- "imported"
}

# as you get the loop above working for "origin", consider the following:
# - what about missing values? can is.na(x) or ifelse() be of use?
# - what about domestic cars?


#-----------------
# Summarize
#-----------------

# is this summary informative?
aggregate(mtcars$qsec,
          by = list(mtcars$gear),
          mean) 


#-----------------
# Visualize
#-----------------

histergram(mtcars$qsec, xlab = "Quarter-Mile Time (seconds)")


boxplot(qsec ~ ???, data = mtcars, main = "Quarter-Mile Time by ??? group")


plot(wt, qsec, 
     xlab = "Weight (1000 lbs)", 
     ylab = "Quarter-Mile Time (seconds)")
 

plot_data <- subset(mtcars, select = c("qsec", "mpg", "hp", "???"))
pairs(plot_data) 
# a new plot style!


#-----------------
# Output files
#-----------------

# Save the data you created
write.csv(mtcars, file = "explore.csv")

# Save a plot image
png(filename = "explore.png")
hist(mtcars$qsec)
dev.off()


