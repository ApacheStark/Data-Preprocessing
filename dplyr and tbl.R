# dplry and tbl

library(dplyr)
library(hflights)

summary(hflights)

## compare tbl to df
head(hflights)
hflights <- tbl_df(hflights)
hflights

## Create a vector with equal values in it
# Then you can create a whole new coloumn determined by the abbreviatons of the previous

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)


## gather unique values within a column
unique(hflights$UniqueCarrier)

### dplyr functions ###

# select(), which returns a subset of the columns COL
# mutate(), used to add columns from existing data COL
# filter(), that is able to return a subset of the rows ROW
# arrange(), that reorders the rows according to single or multiple variables ROW
# summarise(), which reduces each group to a single row by calculating aggregate measures COL

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


## MUTATING IS CREATING
#mutate(df, z = y + x)
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance/AirTime*60)


# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_ratio = loss / DepDelay)

# Add the three variables as described in the third instruction: m2
m2 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime = ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime)


## FILTERING IS MILFERING
#filter(df, logical test), the row version of select
?Comparison
#to look at all the logical operators
# hflights is at your disposal as a tbl, with clean carrier names
str(hflights)
# All flights that traveled 3000 miles or more
filter(hflights, Distance >= 3000)

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c('JetBlue', 'Southwest', 'Delta'))

# All flights where taxiing took longer than flying
filter(hflights, TaxiIn + TaxiOut > AirTime)
#BOOLEANS
# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime < 500 | ArrTime > 2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay > 0 & ArrDelay < 0)

# All flights that were cancelled after being delayed
filter(hflights, Cancelled == 1 & DepDelay > 0)

# Use paste() within mutate()
hf2 <- mutate(hflights, Date = paste(Year, Month, DayofMonth, sep = '-'))


###ARRANGE THE MANGE
#arrange(df, col1, col2) where col1 is the primary arrangement and col2 is the secondary, as so

# Define dtc, where flights are cancelled
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
View(arrange(dtc, DepDelay))

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode) #NOTE: CancellationCode is a factor, but will still use levels to determine order

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay + ArrDelay)


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



