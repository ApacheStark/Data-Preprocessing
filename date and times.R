# dates and times

today <- Sys.Date()
today
class(today) # Date

now <- Sys.time()
now
class(now) # POSIXct POSIXt

# base defaults to YYYY-MM-DD
that_date <- as.Date('1990-01-02')
that_date
class(that_date)

# you can change it with format parameter in the as.Date() function
my_date <- as.Date('01-03-1993', format = '%d-%m-%Y') #don't forget %
my_date
class(my_date)
# will always default output to standardised default "YYYY-MM-DD"

my_time <- as.POSIXct('1993-3-1 17:31:21 AEDT')
my_time
class(my_time)
# will always default output to "YYYY-MM-DD HH:MM:SS Timezone"


# DATE MATHS
# adding 1 to class dates adds a day
my_date + 1

# you can add/subtract dates
that_date - my_date

# adding 1 to POSIXct adds a second
my_time + 1
Sys.time() - my_time

# remember, it all started in Jan 1 1970 at midnight, according to R
unclass(my_date) #in days
unclass(my_time) #in secs
#useful time and date packages
# install.packages('lubridate')
# install.packages('zoo')
# install.packages('xts')


# DATE and TIME ABBREVIATIONS

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = '%Y-%m-%d')
date3 <- as.Date(str3, format = '%d/%B/%Y')


# Convert dates to formatted strings
format(date1, "%A") #just to grab the day
format(date2, '%d') #to grab the numbered day
format(date3, '%b %Y') #to grab abbreviated month and year


#USE ABBREVIATIONS FOR POSIXct

# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

#consult ?strptime for more useful elements
?strptime




# day1, day2, day3, day4 and day5
day1 <- as.Date('2017-12-06')
day2 <- as.Date('2017-12-09')
day3 <- as.Date('2017-12-11')
day4 <- as.Date('2017-12-16')
day5 <- as.Date('2017-12-22')

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)
day_diff
# Average period between two consecutive pizza days
mean(day_diff)
# centre date
mean(pizza)

# with POSIXct times you can calculate exact times between two points
# e.g. login and logout, can be assigned to a time_online  vector (logout - login)
# as long as the dims match
# then calculate the sums and means of each

# also use max(abs(x - y))



# LUBRIDATE
library(lubridate)

ymd('2017 Dec 30')
ymd('17-12-30')
# same out despite differing input
mdy('Dec 30 17')

hms('12:30:10')
# to separate time elements

ymd_hms('17   Dec        30    10    25 0')
# still figures it out despite spaces

# use these to convert variables(cols) from simple character strings to dates
# df$col <- ymd(df$col)  ## so long as the date is in year month day order for this example
