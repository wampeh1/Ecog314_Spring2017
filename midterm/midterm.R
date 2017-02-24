#ECOG 314, Spring 2017
#February 24, 2017
#Take Home Midterm Exam
#
#Complete the following assignment using any resource except another person.
#ECOG 314 GitHub Link: https://github.com/wampeh1/Ecog314_Spring2017
#
#Total points: 50
#Possible extra credit points: 4
#Total possible points: 54


#This line clears the workspace
 rm(list = ls())


#####################################
## SECTION 1: PROGRAMMING CONCEPTS ##
#####################################

  #Section 1 instructions:
  #Answer the following two questions in your own words.
  #Save your answers to the provided objects as strings.
  #(i.e., aS1Q1 <- "my answer")


  #Question 1.1 (2 points)
  #What is a program?
   aS1Q1 <- 


  #Question 1.2 (2 points)
  #Based upon the material covered in our first lecture, what are three reasons
  #why quantitative researchers program?
   aS1Q2 <- 

     
####################
## END: SECTION 1 ##
####################

     



#########################################################
## SECTION 2: VARIABLE ASSIGNMENT AND SIMPLE FUNCTIONS ##
#########################################################


  #Section 2 instructions:
  #Answer the following questions by defining the provided objects.


  #Question 2.1 (2 points)
  #Create a numeric vector that contains all integers between 1 and 1,000 (inclusive) 
   aS2Q1 <- 


  #Question 2.2 (2 points)
  #Create a numeric vector that contains all even integers between 2 and 1,000 (inclusive)
   aS2Q2 <- 


  #Question 2.3 (2 points)
  #Four strings are defined as character vectors below. Using the already defined
  #character vectors, create a single character vector that combines all of them
  #and separates the contents of each with a comma followed by a space.
   str1 <- "The National Mall in Washington"
   str2 <- "D.C. has monuments"
   str3 <- "museums"
   str4 <- "and scenery that draws many tourists from around the world."

   aS2Q3 <- 


  #Question 2.4 (2 points)
  #Translate the following mathematical function into an R function named "zFunction": z = (x + x^2 + x^3) - (y + y^2 + y^3)
  #Then, evaluate for (x, y) = (3, 4) and save your answer to the provided object.

   zFunction <- 
     
   aS2Q4 <- 


  #Question 2.5 (2 points)
  #Create a four-element list where each element is your answer to questions 2.1-2.4.
  #Name the four elements ans1, ans2, ans3, and ans4
   aS2Q5 <- 


  #Question 2.6 (2 points)
  #Display the element ans3 from the list created in question 2.5 using two different methods
         


####################
## END: SECTION 2 ##
####################





######################################################
## SECTION 3: EXPLORATORY DATA ANALYSIS WITH BASE R ##
######################################################

  #Section 3 Instructions:
  #The following questions use a quarterly time series data set containing National Income and Product Account (NIPA)
  #data from the Bureau of Economic Analysis.
  #
  #Variables:
  #  DATE:   quarterly date
  #  PCEC:   nominal personal consumption expenditures (billions of dollars)
  #  GCE:    nominal government spending (billions of dollars)
  #  NETEXP: nominal net exports (billions of dollars)
  #  GDPI:   nominal investment (billions of dollars)
  #  GDPDEF: GDP price deflator
  
  
     
  #Question 3.1 (2 points)
  #Load the file nipa.csv into an R data frame object named "nipa"

     
  #Question 3.2 (2 points)
  #Rename the columns of nipa to: date, c, g, nx, i, gdpdef

     
  #Question 3.3 (2 points)
  #Convert the date column of nipa from a character vector to a date vector

     
  #Question 3.4 (2 points)
  #The GDP accounting identity is Y = C + I + G + NX
  #Using this identity, create a column named "y" in the nipa data frame that is equal to c + i + g + nx


  #Question 3.5 (2 points)
  #The newly created column "y" is nominal GDP. To convert a nominal variable into a real variable, one must
  #divide it by the product of a price deflator and 1/100. Create a variable in the nipa data frame named
  #"ry" that is equal to real GDP.

     
  #Question 3.6 (2 points)
  #There is more than one way to extract and display a column of a data frame to the terminal.
  #Display "ry" using two different methods.

     
  #Question 3.7 (2 points)
  #Using the plot function, create a line plot of real GDP.


  #Question 3.8 (3 points)
  #Economists often think about the nominal components of GDP in terms of their share of total nominal GDP to contextualize their size.
  #This is often referred to as calculating the "nominal share" of a GDP component. 
  #Write a for loop that, for each component of nominal GDP c, i, g, and nx:
  #   i. Prints the variable name of the GDP component to the terminal
  #  ii. Calculates its nominal share
  # iii. Calculates the standard deviation of the answer to part ii.
  #  iv. Prints the answer to part iii. to the terminal
  #Which component of GDP is the most volatile? Save your answer to the provided object as a character vector equal to 'c', 'i', 'g', or 'nx'

   aS3Q8 <- 


  #Question 3.9 (3 points)
  #Create a new column of all missing values in the nipa data frame named "net".
  #Then, use a for loop and a conditional statement to populate "net" with the string "importer" for quarters in which the U.S. was a net importer of goods and services,
  #and "exporter" for quarters in which the U.S. was a net exporter of goods and services.
  #Hint: Net exports is calculated as exports - imports.


  #Question 3.10 (2 points)
  #Perform a cross-tabulation that shows the number of quarters in which the U.S. was a net exporter and a net importer. Save your answer to the provided object.

   aS3Q10 <- 

     
####################
## END: SECTION 3 ##
####################

     



#####################################################
## SECTION 4: EXPLORATORY DATA ANALYSIS WITH DPLYR ##
#####################################################

  #Question 4.1 (2 points)
  #Load the dplyr package.
  #Use the pipe operator and the head function to display the first 15 rows of the nipa data frame.
     

  #Question 4.2 (2 points)
  #Use a function from the dplyr package to restrict the nipa data frame to observations from the beginning of 1988 to present 
     

  #Question 4.3 (2 points)
  #Use a function from the dplyr package to restrict the nipa data frame to only include the date and ry (real GDP) columns


  #Question 4.4 (2 points)
  #Load the file laborIndicators.csv to a data frame object named laborIndicators.
  #These data are the quarterly change in total payroll employment and the quarter-end unemployment rate.
  #Then, rename the columns to date, payemp, and ur. Finally, convert the date column to a date vector.


  #Question 4.5 (2 points)
  #Use a function from dplyr to perform a left join of the nipa and laborIndicators data frames by date. Treat nipa as the "left", or "x", data set.
  #Save the result to the provided object
     
   aS4Q7 <- 


  #Question 4.6 (2 points)
  #Using your answer from question 4.7, create a new column named "year" equal to the year of the "date" column using a function from dplyr and a string manipulation function.
  #Then, use two functions from dplyr to calculate the average unemployment rate by year. Save the result in the provided object.
  #Hint: make sure that the unemployment rate is the right type of vector for performing mathematical computations.  
      
   aS4Q8 <-   
  

####################
## END: SECTION 4 ##
####################

     



##################
## EXTRA CREDIT ##
##################

     
  #Question EC.1 (2 points)
  #Economists often think about macroeconomic data in terms of annualized growth rates. Define an R function named "annpct" whose input is a
  #numeric column vector, and whose output is a numeric column vector of the input's annualized growth rates.
  #Hint: The formula for an annualized quarterly growth rate is (((x[t]/x[t-1])^4)-1)*100, where x is a time series and t indexes for time.

     
  #Question EC.2 (2 points)
  #Using the "annpct" function and a function from the dplyr package, create a new column named "zry" in the nipa data frame that is equal to the
  #annualized growth rate of real GDP.

     
#######################     
## END: EXTRA CREDIT ##
#######################
