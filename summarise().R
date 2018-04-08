
###SUMMERISE THIS
#summarise(df, sum = sum(A), mean = mean(B))
#simply, a customisable summary() function
# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary with variable max_div
Dist1 <- filter(hflights, Diverted == 1)
Dist1
summarise(Dist1, max_div = max(Distance))
#OR SIMPLY
summarise(filter(hflights, Diverted==1), max_div = max(Distance))

##Aggregating functions, single vector in, single data point out
# min(x) - minimum value of vector x.
# max(x) - maximum value of vector x.
# mean(x) - mean value of vector x.
# median(x) - median value of vector x.
# quantile(x, p) - pth quantile of vector x.
# sd(x) - standard deviation of vector x.
# var(x) - variance of vector x.
# IQR(x) - Inter Quartile Range (IQR) of vector x.
# diff(range(x)) - total range of vector x.

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest = min(ArrDelay), average = mean(ArrDelay), latest = max (ArrDelay), sd = sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn) & !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))


##MORE AGGREGATE FUNC
# 
# first(x) - The first element of vector x.
# last(x) - The last element of vector x.
# nth(x, n) - The nth element of vector x.
# n() - The number of rows in the data.frame no other arguments DOES NOT TAKE ARGUMENTS
# n_distinct(x) - The number of unique values in vector x.
# 
summarise(hflights,
          n_obs = n(),
          n_carrier = n_distinct(hflights$UniqueCarrier),
          n_dest = n_distinct(hflights$Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")
str(aa)
# Generate summarizing statistics for aa  
summarise(aa,
          n_flights = n(),
          n_canc = sum(aa$Cancelled == 1),
          avg_delay = mean(aa$ArrDelay, na.rm = TRUE))

