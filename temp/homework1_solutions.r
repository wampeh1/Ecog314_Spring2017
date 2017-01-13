# HOMEWORK 1 (SOLUTIONS)
# 
# DESCRIPTION: In this assignment we will use base R functions to work with 
# vectors. The end goals are to practice using R, to create a working program, 
# and to share the results with others. 
#
# INSTRUCTIONS: Read the instructions provided in the comments. Add your own
# code and comments in the space provided to complete the assignment. 
# Partial answers and useful comments are eligible for partial credit. 
# Complete as many exercises as possible. If things aren't working, seek
# assistance at the piazza site set up for the course.
# 
# TO SUBMIT: save your work in a .R file and email it to the instructor 
# before the deadline for credit.
#-------------------------------------------------------------------------------


#---------------#
# Load Packages #
#---------------#

# Not required for this assignment. leave this part unchanged.



#------------#
# Load Data  #
#------------#

# Not required for this assignment. leave this part unchanged.



#------------#
# Exercise 1 #
#------------#

# Part 1. If you have not already done so please create a Piazza account.

# Part 2. Post a brief introduction on Piazza with your name, your year, what 
#         you are studying and one fun fact in the introductions folder.

# Part 3. Post one question you might have about R, about the class, 
#         or about the homework on Piazza site.



#------------#
# Exercise 2 #
#------------#

# Part 1. Create a character vector called "greeting" with the a single 
#         element, the phrase: "Hello World!"

greeting <- "Hello World!"


# Part 2. Show the contents of greeting using the print() function

print(greeting)

# Part 3. Show the contents of greeting without using the print() function

greeting

# Part 4. Write a line of code to display the help for the print() function. 

?print


#------------#
# Exercise 3 #
#------------#

# Part 1. Assign the value 1 to an object called "x" and print the result

x <- 1
x

# Part 2. Assign the value 2 to an object called "y" and print the result

y <- 2
y

# Part 3. Compute the sum of x and y using the "+" operator. Assign the result 
#         to an object called "z" and print the result. The result should be 3.
#         If not, then change the code in parts 1 and 2 until you get the 
#         desired result in part 3. 

z <- x + y
print(z)


# Part 3. Compute the sum of x and y using the sum() function. The result 
#         should also be 3

sum(x, y)




#------------#
# Exercise 4 #
#------------#

# Part 1. Create a vector containing the numbers 1-5. Assign it to a vector
#         called "numbers" and print the result. HINT: use the c() function, 
#         the seq() function, or the ":" operator. Use built-in R help for 
#         these functions to see examples.

numbers <- 1:5
numbers
    

# Part 2. Confirm the number of elements in the numbers vector. Use a function
   
    
length(numbers)


# Part 3. Create a vector containing the first five even numbers between 1-10. 
#         Use the "numbers" vector created above in your solution. Assign the
#         result to a vector called "even_numbers". and print the result.  
#         HINT: compute the values using arithmetic operators.

even_numbers <- 2 * numbers
even_numbers


# Part 4. Use the "+" operator to add the two vectors created above, numbers 
#         and even_numbers. Then insert a comment to tell the reader how many 
#         elements should be in the result
    
numbers + even_numbers # the length should be 5


# Part 5. Use the sum() function to sum the elements in the two vectors created 
#         above, numbers and even_numbers. How are these different? Insert a
#         comment to explain.

sum(numbers, even_numbers) # the length should be 1




#------------#
# Exercise 5 #
#------------#

# Part 1. Use the * operator to multiply the given vector, "short" with the 
#         longer "numbers" vector created above. Insert a comment describing
#         the outcome

short <- c(-1, 1)

short * numbers


# Part 2. Review the result of part 1. Determine if the 3rd element in the 
#         result is positive or negative.  Record your answer in a vector 
#         called "positive". Assign it the value TRUE (if positive) or FALSE 
#         (if not)

positive <- FALSE


# Part 3. Why do we get this result?  Look for a reference (documentation, 
#         search terms, or web link that might help us to explain it. Share 
#         what you find out in a comment

# The shorter two-element vector x was "recycled" to match the length of the 
# longer vector before multiplication. Helpful links: 
# https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Vector-arithmetic
# http://www.r-tutor.com/r-introduction/vector/vector-arithmetics




#------------#
# Exercise 6 #
#------------#

# Part 1. Consider a simple accounting identity: Profit = Revenue - Cost. 
#         Use the c() function to create two vectors. Call one of these vectors
#         "revenue" and call the other "cost". Assign any 5 numeric values to 
#         each object

revenue <- c(1, 2, 3, 4, 5)
cost    <- c(1, 3, 5, 2, 4)


# Part 3. Compute profits. Use the "-" operator the subtract the cost vector 
#         from the revenue vector. Assign the result to a new vector called 
#         "profit" and print the result. Use a function to confirm that the
#         profit vector has 5 elements     

profit <- revenue - cost
profit
length(profit)
    

# Part 4. Compute net profits. Use the sum() function to compute the total of
#         the values in the profit vector. Assign the result to a new
#         vector called "net_profit" and print the result. It should be a 
#         single value.
    
net_profit  <- sum(profit)
net_profit




#------------#
# Exercise 7 #
#------------#

# Part 1. Suppose the weather report says that the chance of rain on Monday is 
#         50%, the chance of rain on Tuesday is 60%, the chance of rain on 
#         Wednesday is 10%, the chance of rain on Thursday is 0%, and the  
#         chance of rain on Friday is 90%. Create a vector with the chance of 
#         precipitation  over the week. Call it "precip" and print it.

precip <- c(50, 60, 10, 0, 90)
precip


# Part 2. Set the names attribute of the precip vector so that each of the 
#         five values is associated with the correct day of the week. Refer 
#         to the lecture notes for examples. Print the result.

names(precip) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
precip
    

# Part 3. Retrieve the names from the precip object and assign those names to 
#         a new vector object called "days". Next, use the assignment operator
#         to set the names of precip using the new object. Verify that you get 
#         the same result in precip
    
days <- names(precip)
names(precip) <- days
precip




#------------#
# Exercise 8 #
#------------#

# Part 1. The vectors given below contain population data for Washington DC in 
#         selected years (year, total population, and the fraction of the total 
#         population that identifies as either black or white).
#
#         Use the names() function and the given vectors to associate each 
#         vector element with the appropriate year for the observation.
#         Print the result.

year          <- c(1970, 1980, 1990, 2000, 2010, 2014)
dc_white_frac <- c(0.277, 0.269, 0.296, 0.308, 0.402, 0.436)
dc_black_frac <- c(0.711, 0.703, 0.658, 0.60, 0.507, 0.49)
dc_pop        <- c(756510,638333, 606900, 572059, 601723, 672228)


names(dc_white_frac) <- year
names(dc_black_frac) <- year
names(dc_pop) <- year

print(dc_white_frac)
print(dc_black_frac)
print(dc_pop)


# Part 2. Calculate the fraction of D.C. residents do not identify as black or 
#         white in each year. Use the vectors given above

dc_other_frac <- 1 - (dc_black_frac + dc_white_frac)
print(dc_other_frac)


# Part 3. Calculate the number of white and black residents in D.C. in each 
#         year using the vectors given above.

black_pop <- dc_black_frac * dc_pop
white_pop <- dc_white_frac * dc_pop
print(black_pop)
print(white_pop)





#------------#
# Exercise 9 #
#------------#

# The Four Fours challenge! Compute a specific target value, using an  
# expression with EXACTLY and ONLY four instances of the number 4 and any 
# combination of decimals and arithmetic operations including: +, -, *, /, ^,  
# sqrt(), and factorial(). In other words, given an integer x, define a 
# function f, such that x = f(4, 4, 4, 4). When counting fours both 44 and 4.4 
# count as two fours, while .4 and 4 count as one four.
#
# Examples
#
#     0 = 4 + 4 - 4 - 4
#     1 = 4.4/4.4
#     2 = ?


# Part 1. Write four-fours solutions for 1 and 2 and verify that each expression 
#         is correct using the "==" operator. Hints: type ?"==" with quotes  
#         around the equals to view the built in documentation, and...
#         be creative! 


0 == 4 + 4 - 4 - 4

1 == 4.4 / 4.4

2 == factorial(4) - 44 / sqrt(4) 


# Part 2. Keep going! Find as many four-fours solutions as you can for the 
#         numbers 0-20. Write R code to test each solution and print a  
#         confirmation message using the paste() function. 


x <- 3
three <- 444^(-4)  # is this right?
paste(x, "==", three, "is", x == three)



