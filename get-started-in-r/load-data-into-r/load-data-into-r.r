library(tidyverse)

chocolateData <- read_csv("../../data/input/flavors_of_cacao.csv")
# some of our column names have spaces in them. This line changes the column names to
# versions without spaces, which let's us talk about the columns by their names.
names(chocolateData) <- make.names(names(chocolateData), unique = TRUE)

# Your turn!
# To give you practice reading in files, I've added a second dataset to this notebook
# as well. This dataset is in the following place: ../input/food-choices/food_coded.csv
# read in your dataset and save it as a variable called "foodPreferences"
foodPreferences <- read_csv("../../data/input/food_coded.csv")

# the head() function reads just the first few lines of a file
head(chocolateData)
# the tail() function reads in the just the last few lines of a file.
# we can also give both functions a specific number of lines to read.
# This line will read in the last three lines of "chocolateData".
tail(chocolateData, 3)

# Your turn!
# Get the first four lines of the foodPreferences dataframe you read in earlier
head(chocolateData, 4)

# make a little example vector
a <- c(5, 10, 15)
# if you ask for something at an index, but don't say which one, you'll get everything
a[]
# if you ask for a value at a specific index, you'll only get only that value. In R,
# indexes start counting from 1 and go up. (So 3 is the third)
a[1]

# get the contents in the cell in the sixth row and the forth column
chocolateData[6, 4]
# get the contents of every cell in the 6th row (note that you still need the comma!)
chocolateData[6, ]
# if you forget the coulmn, you'll get the 6th *column* instead of the 6th *row*
head(chocolateData[6])
# I've used "head" here because the column is very long and I don't want
# to fill up the screen by printing the whole thing out

# Get the first row of your "foodPreferences" data_frame
head(foodPreferences, 1)
# Get the value from the cell in the 100th row and 4th column
foodPreferences[100, 4]

head(chocolateData)

# get all rows EXCEPT the first row and all columns of chocolateData
# By putting it back in the same variable, we're overwriting what was in
# that variable before, so be careful with this!
chocolateData <- chocolateData[-1, ]
head(chocolateData)

# Your turn!
# The 5th column in the "foodPreferences" dataset has a lot of values that aren't
# numbers (nan means "not a number"). Can you remove the 5th column from the dataset?
foodPreferences <- foodPreferences[, -5]
head(foodPreferences)
