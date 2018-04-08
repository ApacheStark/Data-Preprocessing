### VAPPLY
# explicitly say what the output will be

nyc <- list(area = c('Bronc', 'Queens'), pop = c(420000,560000))
cities <- c('Melbourne', 'Sydney', 'Adelaide', 'Brisbane', 'Perth')
petrol <- c(1.50, 1.45, 1.30, 1.55)


vapply(cities, nchar, numeric(2))
# numeric has to be 1 if only data length is 1
# numeric(2) will throw an error since there is one one input

vapply(cities, length, integer(1))
# length in this regard only gives an input as 1, not a character count

basics <- function (x) {
  c(min = min(x), max = max(x), mean = mean(x), median = median(x))
}

# create a list
set.seed(100)
temp <- list(c(1,3,5,2,5,4,5), c(1,6,7,4,22,9,8))
vapply(temp, basics, numeric(4))
