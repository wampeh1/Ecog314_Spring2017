# HOMEWORK 4
# 
# DESCRIPTION: In this assignment we will read in and process a real world data set.
#
# INSTRUCTIONS: Read the instructions provided in the comments. Add your own
# code and comments in the space provided to complete the assignment. 
# Partial answers and useful comments are eligible for partial credit. 
# Complete as many exercises as possible. If things aren't working, seek
# assistance at the piazza site set up for the course.
# 
# TO SUBMIT: save your work in a .R file and submit it on the piazza site in the hw2 folder. 
# Make sure you only share it with instructors or just with Shifrah.
#-------------------------------------------------------------------------------


#---------------#
# Load Packages #
#---------------#

# (NONE REQUIRED)



#------------#
# Load Data  #
#------------#

# Download the data file hmda_small from the github site. Save it in your homework 4
# folder and read the data into R using the read.csv() function. Be sure to assign the 
# data to an object called hmda when you read it in.


#------------#
# Exercise 1 #
#------------#

# Part 1: Use the str() function to get some information about your data set. 
#         What data types are present in your data frame? Are string coded as factors
#         or character objects? If they are coded as factors go back and modify your 
#         read.csv() call so that they are read in as character objects.



# Part 2: Call names() on hmda. What is the result? Use the length() function to 
#         calculate the number of variables in hmda.




# Part 3: Select only the following columns from the data "loan_purpose_name", 
#         "action_taken_name", "applicant_ethnicity_name", "applicant_race_name_1", 
#         "applicant_sex_name", "state_name", "loan_purpose_name", "loan_type_name",
#         "loan_amount_000s", "applicant_income_000s" Call the resulting data frame hmda_small




# Part 4: Create a new column that is the the actual loan amount in dollars. Run some summary 
#         statistics on the loan amount. What is the minimum value loan in the data? What is the
#         maximum? What is the mean?



# Part 5: Using the unique command find out what values each of these variables takes on:
#         a. "loan_purpose_name"
#         b. "action_taken_name"
#         c. "applicant_ethnicity_name"
#         d. "applicant_race_name_1"
#         e. "applicant_sex_name"
#         f. "loan_purpose_name"
#         g. "loan_type_name"


# Part 6: a. How many loans in the data set are for each of the following:
#           "Home improvement","Refinancing","Home purchase"   
#         b. How many "Application denied by financial institution"  observations were there?
#            What fraction of total observations is this?
# 



# Part 7: Using the ifelse() create a new variable called race_ethnicity that is the variable
#         applicant_ethnicity_name when applicant_ethnicity_name is equal to "Hispanic or Latino"
#         and applicant_race_name_1 otherwise. Calculate summary statistics of the loan variable
#         for each racial and ethnic group. Which group has the largest average loan? Which group
#         has the largest standard deviation in loan amount?


#------------#
# Exercise 2 #
#------------#

# Part 1: Calculate the mean loan amount by state using the aggregate command. 
#         Which state has the highest mean loan amount? Which state has the lowest?



# Part 2: Calculate the fraction of white loan applicants by state. 
#         Which state has the highest fraction of white loan applicants? Which state has the lowest?


#------------#
# Exercise 3 #
#------------#

# Part 1: Create a bar chart of the average loan amount by racial and ethnic group. Make
#         sure your axes are properly labeled and your chart has a title.





# Part 2: Create a bar chart of the fraction of loan denied by the financial institution by racial
#         and ethnic group. Make sure your axes are properly labeled and your chart has a title.





# Part 3: Create a histogram of the loan amount. 




# Part 4: Create a scatter plot of applicant income vs. loan amount. Do you see any relationship?
#         use the cor() function to calculate the correlation between the two variables.




#----------------#
# Extra Credit 1 #
#----------------#

# Explore the data some more!





#----------------#
# Extra Credit 2 #
#----------------#

# Complete the program we started in class 4 (eda_exercise.R)
# Download the *updated* version of the program tempalate from github and follow
# the instructions in the comments
#
# link: https://github.com/wampeh1/Ecog314_Spring2017/tree/master/lecture4
# file name: eda_exercise.R

