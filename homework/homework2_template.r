# HOMEWORK 2
# 
# DESCRIPTION: In this assignment we will review vectors and some built in functions. We will
# practice writing functions starting very simply and building to something quite complex. 
# The end goal is to become comfortable with writing function in R.
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

# (NONE REQUIRED)


#------------#
# Exercise 1 #
#------------#

# Indexing

# Part 1. Use the defined vectors a and b and indexing operations to construct the following words
# 		  b. diversity
#         c. treasury
#		  e. windshear

a <- c("h","o","w","a","d")
b <- c("u","n","i","v","e","r","s","i","t","y")

# example

c("h") == a[1]

# now your turn!

c("d","i","v","e","s","i","t","y")      == # fill in your answer here
c("t","r","e","a","s","u","r","y")      == # fill in your answer here
c("w","i","n","d","s","h","e","a","r")  == # fill in your answer here


# Part 2. Use the defined vector d and the indexing operations from class to return
#         a. 10
#         b. All numbers greater than 5
#	      c. All numbers greater than 3 and less than 5
#		  d. All numbers less than 4 or greater than 7
#         e. All numbers less than or equal to 5 and less than 3
#         f. All numbers not equal to 5 
#         g. All even numbers
#         h. All odd numbers (HINT use !)
#         i. All prime numbers

d <- c(1,2,3,4,5,6,7,8,9,10)

c(10)                 == # fill in your answer here
c(6,7,8,9,10)         == # fill in your answer here
c(4)                  == # fill in your answer here
c(1,2,3,8,9,10)       == # fill in your answer here
c(1,2)                == # fill in your answer here
c(1,2,3,4,6,7,8,9,10) == # fill in your answer here
c(2,4,5,8,10)         == # fill in your answer here
c(1,3,5,7,9)          == # fill in your answer here
c(2,3,5,7)            == # fill in your answer here


#------------#
# Exercise 2 #
#------------#

# Student Loans

# Part 1. Suppose you are a bank handling student loans. You have 5 loans in your portfolio. 
#         The loan amounts are $100,000, $150,000, $45,000, $20,000, $79,000. Create a numeric vector of the loan
#         amounts called loan_amounts. Assign the names "student a", "student b" ... to the vector. Print out the vector
#         Calculate the total loan amount and assign in to the variable total_loan_amount and print it out.





# Part 2. Loan payments can be on time or delinquent. Students a,b,d payed their last payment on time, students c and e did
#         not make their last payment. Create a charter vector called delinquency with the values either "on time" or "delinquent". 
#         Assign appropriate names to the vector.




# Part 3. Using the comparison methods we covered in class and the sum() and length() function calculate the fraction of loans that
#         are delinquent assign the result to the variable frac_delinquent and print it.



#------------#
# Exercise 3 #
#------------#
  
# Fun with FUNctions

# Part 1. Create a function pow_two(): it takes one argument and returns that number squared (that number times itself).

pow_two <- function(x){

	return()
}


# Part 2. Create a function sum_abs(), that takes two arguments and returns the sum of the absolute values of both arguments.

sum_abs <- function(y,z){


	return()
}

# Part 3. Write two test cases for each function to make sure they are working properly. For example:

pow_two(2) == 4
sum_abs(-1, -3) == 4

# fill in your 4 test cases here





# Part 4. Finish the function definition for interpret(), that interprets the number of profile views on a single day:
#         The function takes one argument, num_views. If num_views is greater than 15, the function prints out "You're popular!" 
#         to the console and returns num_views. Else, the function prints out "Try to be more visible!" and returns 0.


interpret <- function(num_views) {
  if (num_views > 15) {



  } else {


  }
}


# Part 5. Call the interpret() function twice: on the first value of the linkedin vector and on the second element of 
#         the facebook vector. The linkedin and facebook vectors have already been created for you

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Call the interpret function twice


# Part 6. Using two for loops call the function interpret on all the elements of linkedin and facebook




#------------#
# Exercise 4 #
#------------#

# APR vs. APY 

# APR is the annual rate of interest without taking into account the compounding of interest within that year.
# APR = Periodic Rate * Number of Periods in a Year
# APY does date into account the effects of intra-year compounding.
# APY = ( (1 + Periodic Rate) ^ Periods ) - 1


# Part 1. Complete the following function that calculates the APR for a given periodic rate and number of periods

APR_calculator <- function(periodic_rate, n_of_periods){

	APR <- # fill in your answer here

	return(APR)
}


# Part 2. Complete the following function that calculates the APY for a given periodic rate and number of periods

APY_calculator <- function(periodic_rate, n_of_periods){

	APY <- # fill in your answer here

	return(APY)
}

# Part 3. Suppose your credit card company charges 1% interest each month. If you carry a balance for 1 year 
#         what is the difference between your APR and APY?

difference <- # fill in your answer here

print(difference)

#------------#
# Exercise 5 #
#------------#

# Loan Rate Calculator

# The annuity payment formula is given by:
# A = P * (i + i / ( (1 + i) ^ n - 1) )
# where A = periodic payment amount, P = amount of principle net of initial payments (subtract down-payments)
# i = periodic interest rate, n = total number of payments


# Part 1. Write a function that takes as input - amount of principle (p), down-payment (dp), interest rate (i), 
#         number of years in loan (y) - and return the monthly payment for the loan.

annutity_payment <- function(p, dp, i, y) {

	annutity <- 

	return(annutity)

}

# Part 2. Using your annutity_payment function write a function that calculates the total amount payed.

total_payed <- function(p, dp, i, y){

	total <-

	return(total)

}


# Part 3. Now using your functions evaluate which of these loans result in you paying the least amount:
#         a - Principal = 200,000, Down Payment = 20,500, APR = 4.5%, Length of Loan = 30 years. 		  
#         b - Principal = 200,000, Down Payment = 30,000, APR = 5.0%, Length of Loan = 15 years. 		  
#         c - Principal = 200,000, Down Payment = 30,000, APR = 4.5%, Length of Loan = 30 years. 		  
#         d - Principal = 200,000, Down Payment = 50,000, APR = 5.0%, Length of Loan = 15 years. 		  
#         e - Principal = 200,000, Down Payment = 50,000, APR = 6.0%, Length of Loan = 15 years. 		  
#         f - Principal = 200,000, Down Payment = 20,500, APR = 5.0%, Length of Loan = 30 years. 		  





# Part 4. Why might someone take a less than optimal option?





# Part 5. Now suppose instead of a fixed rate mortgage you are looking to get an adjustable rate mortgage (ARM). 
#         The starting rate is guaranteed at 3% APR for the first five years but then will increase by 1.5% every 60 months 
#         The principal amount is 200,000 and your down payment is 20,000. The total length of the loan is 15 years. 
#         
#         What will the total cost of your mortgage be? 
#         
#         HINT: You may want to write a function that computes the balance paid after X months using this formula.
#			    Balance Paid = (12 * monthly payment / annual interest rate)((1 + annual interest rate/12) ^ number of months paid - 1)




#------------#
# Exercise 6 #
#------------#

# Rock Paper Scissors!

# Part 1. Write a function that takes as inputs the choice of Rock, Paper, or Scissors for player_1 and player_2 
#         and returns the correct winner. The function should return the values "Player 1", "Player 2", or "Tie" appropriately


rock_paper_scissors <- function(player_1, player_2){

	# use the if else if else structure we discussed in class
	
	if () {

		winner <- 

		return(winner)

	} else if () {

		winner <- 

		return(winner)

	} else {

		winner <- 

		return(winner)
	}

}


# test the results

rock_paper_scissors("rock","rock") == "Tie"
rock_paper_scissors("rock","paper") == "Player 1"
rock_paper_scissors("scissors","rock") == "Player 2"


# Part 2. Write a function that takes as inputs the choice of Rock, Paper, or Scissors for user and then uses the function sample()
#         to randomly assign the computer to be "rock","paper", or "scissors". The function should return either 
#         "Computer", "User", or "Tie" depending on the winner. It should also print either "The winner is computer" or "The winner is user" 
#         or "Tie"


rock_paper_scissors_computer <- function(user){

	options  <- c("rock","paper","scissors")
	
	computer <-

	print(paste("computer is", computer))
	
	if () {

		winner <- 

		return(winner)

	} else if () {

		winner <- 

		return(winner)

	} else {

		winner <- 

		return(winner)
	}

}


# Part 3. Write a for loop that loops over all the inputs in the vector inputs and plays rock_paper_scissors_computor. 
#         Use a counter variable to keep track of the number of times you beat the computer

inputs <- c("rock","paper","rock","scissors","paper","paper")
wins <- 0

for () {


	if(){

		wins <-
	
	}

}
