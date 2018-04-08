
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

