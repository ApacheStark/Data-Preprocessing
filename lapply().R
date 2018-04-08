### LAPPLY
# lapply() functions returns lists
# use lapply to quickly use functions on lists/dataframes/matrices

nyc <- list(area = c('Bronc', 'Queens'), pop = c(420000,560000))
cities <- c('Melbourne', 'Sydney', 'Adelaide', 'Brisbane', 'Perth')
petrol <- c(1.50, 1.45, 1.30, 1.55)

## here put the list first then the function
lapply(nyc, class)
# returns list of classes for each parameter

lapply(cities, nchar)
# also returns list

unlist(lapply(cities, nchar))
# unlists and returns a vector instead


times <- function(x, factor) {
  x * factor
}

# with multiple variables, simply state them in the lapply()
times2 <- lapply(petrol, times, factor = 2)
unlist(times2)
# returns vector once unlist()
