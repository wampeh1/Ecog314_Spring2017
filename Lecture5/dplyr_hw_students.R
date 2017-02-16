## Dplyr Homework
## Assigned: February 17, 2017
## Due: February 22, 2017

## Overview: This homework assignment will cover the different ways in 
## which to use the dplyr package. 

## Note: All questions must be answered using the dplyr package.

## Datasets: For this homework you will need the lending_club_loans csv file. 
## Additionally, the lending_club_data_dic.xlsx file will be useful
## Both can be found on the github

## Before you begin I would recommend reading the Dplyr overview written
## by Hadley Wickham, the package creator located at: 
## http://r4ds.had.co.nz/transform.html


## Remember, before you submit your homework, make sure the code runs
## without any errors, be sure to Source your homework file to test it 


# ----------#
#  Libraries
# ----------#

# load the dplyr library


#--------------#
# Exercise 1
# -------------#

########
# Part a
# Read in the raw data and assign it to lending_club. 
# HINT: Be sure to read characters in as characters and not as factors
# What are the dimensions of the lending club data frame?


##########
# Part b
# Take a look at your loans data frame by calling it in the console, 
# does the formatting look good, are the types correct?
# What is the type of the following variables (use the typeof() function): 
# id, term ,int_rate, loan_amnt, issue_d, and installment?



###########
# Part c
# Create a new data frame called lending_club_small and keep the following columns:
# id, loan_amnt, funded_amnt, term, int_rate, installment, grade, emp_length, 
# home_ownership, annual_inc, issue_d, loan_status, total_acc, addr_state.

lending_club_small <- 

###########
# Part e
# What does the substr function do?
# what arguments does it use?

## ANSWER HERE


# ----------------#
# Exercise 2
# ----------------#

## Now that we've succesffully loaded the data we are interested in,
## we can begin to take a more in-depth look at it and clean as necessary

#########
# Part a. 
# Right now the term varaible is a character taking on the values " 36 months" " 60 months".
# using the mutate(), substr(), and as.numeric() functions, please change this variable so that it
# takes on the values 36 or 60. Be sure to re-asign the results to lending_club_small

lending_club_small <- 
    
#######
# Part b
# The int_rate variable is a charater variable and contains an annoying "%". In order to learn more about this variable
# we need to convert this into a numeric. A useful function in this case is the gsub function. 
# The gsub function replaces all matches of a string in a larger string. For example if my_string = "my_name_is_shifrah"
# then gsub("_", " ", my_string) will return "my name is shifrah". Use this function to turn the int_rate varaible from its current format
# ("10.65%") into a decimal (0.1065)

lending_club_small <- 
#########
# Part c
# In order to recode the emp_length variable we will first need to find the unique values in the 
# dataset and then decide how we want to encode them

# i. Find the unique values of the emp_length variable


# ii. Create a new variable called emp_term in your lending_club_small data frame which has numeric values for the
#     number of years worked. Treat "< 1 year" as 0 and "10+ years" as 10. Assign your results to lending_club_small
#     HINT: you will need to mutate the variable emp_term multiple times using the ifelse() function. 
#           you can mutate the same variable multiple times within a mutate call. 


##########
# part d
#  i. Check the data dictionary for a description of the total_acc variable
#     what does the variable show?

## ANSWER HERE

# ii. Do you think it makes sense to leave it as an integer value
#     or would it be more useful to bin the data into character based buckets
#     such as small, medium, large?
#     Use the hist command to plot a basic histogram of the total_acc variable



# ANSWER HERE

# iii. Use the cut() function to create a new column, crdt_lines. You will what to look up the syntax for 
#      this function. But generally cuts takes three arguments: a vector that you want to cut, a vector of the values to cut on
#      and a vector of labels for each of the cuts.
#      In this case the values should be "small" if total acc [0, 10], "medium" if (10, 25] and 
#      "large" if (25, 100]. Be sure to assign your data frame to lending_club_small


############
# Part e
# We have the loan amount, the interest rate, and the term,
# use those to create a column, ttl_val, showing the total amount paid, A
# with the formula A = P(1 + r/t)^nt. Assume monthly payments and that interest compounds monthly.
# P = principle, r = rate, t = number of periods per year, n = number of years


# ------------#
# Exercise 3
# ------------#

## Now that our data is set up nicely we can start to ask questions 
## of our data and utilize the real power of dplyr

######## 
# Part a
# Find the maximum loan amount for each of the different terms using the group_by() and summarise() function.

answer_3a <- 

#########
# Part b. 
# Make a table showing the mean loan amount and mean income by term and addr_state
# Your variables should be called mean_loan_amt and mean_income

answer_3b <- 

#########
# Part c.
# i. Do we see that as people have larger incomes they also take on larger loans.
#    First add a column to lending_club_small that is the leverage ration (call it lev_ratio) 
#    (ratio of loans to income). The aggregate by income level and find the mean (call it avg_lev_ratio). 
#    Finally order the table by annual income. 

answer_3c <- 
# ii. Find the correlation between the avg_lev_ratio and the annual_inc using the cor function
    


# iii. Make a quick plot using the plot function of annual income vs. average leverage ratio.
#      Don't just rely on the number
    


# iv. Does the plot give you additional infomation about people's leveraging behavior?

# ANSWER HERE

############
# Part d
# Take a look at the value in the loan_status variable, what are the possible
# values?


##############
# Part e
# Let's now take a look at finding any differences between "good" loans
# and "bad" loans, we'll define "good" as loans that are charged off, fully paid,
# or current, and "bad" as the rest. Write two vectors corresponding to
# the correct loan statuses

good <- 
bad  <- 

###########
# Part f
# Add a column called "status" to lending_club_small using the ifelse() function.
# If the loan is good the status should be "good" otherwise it should be "bad".

############
# Part g
# How many good loans and how many bad loans do we have?

answer_3g <- 

# Do you think this is a large enough sample size of both statuses to derive 
# meaningful conclusions from generate statistics?

# ANSWER HERE

#############
# Part h
# Find the following:

# i. The difference in average loan amount by status:

answer_hi <- 

# ii. So far we've seen differences in loan amount by status, let's 
# take a look at interest rates, do bad loans tend to have higher average interest rates?

answer_hii <- 

# How much greater is the interest rate on the average bad loan
# than the interest rate on the average good loan?


# Do you think that this higher interest rate is causative or corellative?
# (Do you think that having higher interest may cause people to default on 
# the loan or do you think that people more likely to default have to 
# pay higher interest and then, unsurprisingly, have bad loans in higher numbers)
    

## END OF HOMEWORK, BE SURE TO TEST THAT THIS FILE SOURCES WITHOUT ERROR 
## BEFORE SUBMITTING TO THE INSTRUCTORS
