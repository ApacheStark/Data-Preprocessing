## joining data with dplyr
library(dplyr)

## KEYS
# a key is a column that relates two datasets together in order to join the sets properly
# determine the primary key and the foreign key
# the primary: the first dataset
# the foreign: the second dataset, (both have the SAME keys, the order determines merely the order of col)
# the keys can have MUTLIPLE variables, make sure you don't double up on observations


## JOINS

left_join(df1, df2, by = 'primary key')
#the first df1 will appear to the left of the df2
#right_join() does the opposite, treating the second df as primary
#this means that it will only drop observations that don't match the primary key of the 2nd, unlike left_join()

left_join(df2, df3, by = c('primary key1', 'primary key2'))
#multiple keys

#datacamp example
# Finish the code below to recreate bands3 with a right join
bands2 <- left_join(bands, artists, by = c("first", "last"))
bands3 <- right_join(artists, bands, by = c('first', 'last'))

# Check that bands3 is equal to bands2
setequal(bands2, bands3)
# setequal() inputs two df to see if they are identical

inner_join(df1, df2, by = 'key')
# inner_join() joins data that ONLY matches

full_join(df1, df2, by = 'key')
# joins everything

## PIPES
# Find guitarists in bands dataset (don't change)
temp <- left_join(bands, artists, by = c("first", "last"))
temp <- filter(temp, instrument == "Guitar")
select(temp, first, last, band)

# Reproduce code above using pipes
bands %>% 
  left_join(artists, by = c('first', 'last')) %>%
  filter(instrument == 'Guitar') %>%
  select(first, last, band)

# Create goal2 using full_join() and inner_join() 
goal2 <- artists %>% 
  full_join(bands, by = c("first", "last")) %>% 
  inner_join(songs, by = c("first", "last"))