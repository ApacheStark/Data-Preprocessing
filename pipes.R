# PIPES

# install.packages('magrittr')
library(magrittr)

# Replaces the object in any function

# Object %>% function(arg2, arg3)  # where arg1 WAS the object

c(1,3,5,6,7, NA) %>% mean(na.rm = TRUE)

# To simplify it further, a pipe is simple a 'then'

# You grab an object 'then' filter() it 'then' mutate() and so on

library(hflights)
library(dplyr)
hflights %>% mutate(diff = TaxiOut - TaxiIn) %>% filter(!is.na(diff)) %>% summarise(avg = mean(diff))
# take object, then mutate a new column, then filter the NAs out of col, then summarise mean of new col


# Count the number of  flights that take longer than driving
hflights %>% 
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance/RealTime*60) %>%
  filter(!is.na(mph) & mph < 70) %>% 
  summarise(n_less = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))

# Count the number of overnight flights
hflights %>%
  filter(!is.na(DepTime) & !is.na(ArrTime) & DepTime > ArrTime) %>%
  summarise(num = n())



## Using group_by

# very handy for organisaing categorical data for the summarise() function

# Make an ordered per-carrier summary of hflights where:
 # you have the percentage of cancelled flights (1 is cancelled, 0 is not)
 # you have the average arrival delay where flights actually showed up (na.rm = TRUE)
 # arrange by new variables
hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(p_canc = mean(Cancelled)*100,
            avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
  arrange(avg_delay, p_canc)

#again but take into consideration the negative average delay time
#as opposed to na.rm in the mean() function you can simply filter out all rows prior
hflights %>%
  filter(!is.na(ArrDelay) & ArrDelay > 0) %>%
  group_by(UniqueCarrier) %>%
  summarise(avg = mean(ArrDelay)) %>%
  mutate(rank = rank(avg)) %>%
  arrange(rank)

#you can mutate() after a summarise() to add additional information, in this regard, a rank

#advanced examples from Datacamp
# How many airplanes only flew to one destination?
hflights %>%
  group_by(TailNum) %>%
  summarise(ndest = n_distinct(Dest)) %>%
  filter(ndest == 1) %>%
  summarise(nplanes = n())

# Find the most visited destination for each carrier
hflights %>%
  group_by(UniqueCarrier, Dest) %>%
  summarise(n = n()) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1)


## Connection to and use of databases

# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
  group_by(carrier) %>%
  summarise(n_flights = n(), avg_delay = mean(arr_delay)) %>%
  arrange(avg_delay)
#having grouped by, you then only call n() to get the count by that categorical grouping




