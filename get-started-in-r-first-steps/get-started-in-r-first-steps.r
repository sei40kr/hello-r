print("Welcome to R!")

print("I'm coding in R")

# running this will pull up the documentation page for the print() function
?print()

# in R, you can store data in a variable by using either "=" or "<-"
textToPrint <- "this is some text to print"
textToPrint
# This line will generate an error becuase there is nothing called "texttoprint"
texttoprint

# Your turn! Can you get "I'm coding in R" to print in the output?
aSentence <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

# the nchar() function tells you the number of characters in a variable
nchar(textToPrint)

# the c() function concatenates (strings together) all its arguments
c(textToPrint, textToPrint, textToPrint)

# Your turn! Try the following three exercises on your own.
# print your variable "aSentence" you made above
print(aSentence)
# find out the number of characters in "aSentence"
nchar(aSentence)
# concatenate the "textToPrint" and "aSentence" variables
c(textToPrint, aSentence)

anExampleOfCharacters <- "someText"
# we can check the data type of a variable using the function str() (like "structure")
str(anExampleOfCharacters)

# Your turn!
# Check the data type of the "aSentence" variable you made above.
str(aSentence)

# let's create some numeric variables
hoursPerDay <- 24
daysPerWeek <- 7
# we can check to make sure that these actually are numeric
class(hoursPerDay)
class(daysPerWeek)
# since this is numeric data, we can do math with it!
# "*" is the symbol for multiplication
hoursPerWeek <- hoursPerDay * daysPerWeek
hoursPerWeek

# Your turn!
# Create a numeric variable "minutesPerHour" and use it to calcuate a new variable called
# "minutesPerWeek" that has the number of minutes per week in it
minutesPerHours <- 60
minutesPerWeek <- minutesPerHours * hoursPerWeek
minutesPerWeek

# Important! Just becuase something is a *number* doesn't mean R thinks it's numeric!
a <- 5
b <- "6"
# this will get you the error "non-numeric argument to binary operator", becuase b isn't
# numeric, even though it's a number!
a * b

# You can change character data to numeric data using the as.numeric() function.
# This will let you do math with it again. :)
a * as.numeric(b)
# check out the stucture: note that b changes from "chr" to "num
str(b)
str(as.numeric(b))

# Your turn!
# What happens when you try to use the as.numeric() function on text that isn't data?
# Trying running the as.numeric() function on your "aSentence" variable from earlier.
as.numeric(aSentence)

# You'll get a boolean back if you ask R "are these two things the same?" using "=="
"a" == "b"
1 == 1

# Your turn!
# First, take a guess: will 6 == "6" return TRUE or FALSE?
# Then test your prediction. Are you surprised by the outcome? What does this tell you
# about datatypes in R?
6 == "6"

# let's make a vector
listOfNumbers <- c(1, 5, 91, 42.8, 100008.41)
listOfNumbers
# multiply every number in the vector by 5
5 * listOfNumbers
# add one to every number in the vector
listOfNumbers + 1

# Your turn!
# divide every number in the vector by 2. In R, you do division using the / symbol.
listOfNumbers / 2

# get the first item from "listOfNumbers"
listOfNumbers[1]

# Your turn!
# get the third item from "listOfNumbers"
listOfNumbers[3]
