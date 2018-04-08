### SAPPLY
# simplifies list to array if possible

nyc <- list(area = c('Bronc', 'Queens'), pop = c(420000,560000))
cities <- c('Melbourne', 'Sydney', 'Adelaide', 'Brisbane', 'Perth')
petrol <- c(1.50, 1.45, 1.30, 1.55)


sapply(cities, nchar)
# converts/simplifies to a one dim array, not a list like lapply()

sapply(cities, nchar, USE.NAMES = FALSE)
# straight to a vector class 
# (the previous is still considered an array and will throw errors if treated like one)

# create a random function for grabbing elements
first_last <- function(name) {
  name <- gsub(' ', '', name)
  letters <- strsplit(name, split = '')[[1]]
  c(first = min(letters), last = max(letters))
}

# to gain the 'first' and 'last' ordered letter (not the actual first and last letter)
sapply(cities, first_last)

# assigning parameters within a function for output
extremes <- function (x) {
  c(min = min(x), max = max(x))
}

# create a matrix then a list of values to use
set.seed(100)
temp <- list(c(1,3,5,2,5,4,5), c(1,6,7,4,22,9,8))
# use function for min and max in all of the list
sapply(temp, extremes)

unique_letters <- function(name) {
  name <- gsub(' ', '', name)
  letters <- strsplit(name, split = '')[[1]]
  unique(letters)
}


# let's say you have a list of lists called 'log', and you wanted to filter through
# all the entries to find the ones that equal 'success'
# you can do that using the `[[` function, which essentially means filter all and find 

# Use sapply() to select the success element from each log: results
results <- sapply(logs, `[[`, "success")

# Call mean() on results
mean(results)

# Use sapply() to select the details element from each log
sapply(logs, `[[`, "details")
