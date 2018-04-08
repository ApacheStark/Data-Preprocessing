## select(tbl, Group, Sum)
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)
#from Actual to Dep excluding Air
select(hflights, ActualElapsedTime:DepDelay, -AirTime)


### select() helper functions
# starts_with("X"): every name that starts with "X",
# ends_with("X"): every name that ends with "X",
# contains("X"): every name that contains "X",
# matches("X"): every name that matches "X", where "X" can be a regular expression,
# num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05,
# one_of(x): every name that appears in x, which should be a character vector.

select(hflights, ends_with('Num'), contains('Ca')) 

##dplyr can be faster than base R coding
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, 16:18)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, 1:6, -3)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, starts_with('T'))
