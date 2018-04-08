### tidy data
# install.packages('tidyr')
library(tidyr)
# col <- c('X','Y')
# A <- c(1,5)
# B <- c(3,4)
# C <- c(8,0)
# wide_df <- data.frame(cbind(col, A, B, C))
wide_df

#GATHER and SPREAD
#gather coloumns of wide_df
long_df <- gather(wide_df, my_key, my_val, -col)
long_df
#gather(data, key, value, ...)
#data = dataset
#key = is the name of the new key coloumn HEADRS
#values = is the name of the new values coloumn NUMBRS
#... = the rest of the coloumns as bare names (or excluded)

# gather() should be used when you have columns that are 
# not variables (are values) and you want to collapse them into key-value pairs.
## SIMPLY PUT: gather() is wide to long

#now do the opposite of gather(), 
wide_df <- spread(long_df, my_key, my_val)
wide_df
#my_key becomes headers again
#my_val remains values but gets redistributed
#col is not touched again, just shortened
## SIMPlY PUT: spread() it long to wide


#SEP and UNITE
a <- rep(1:2, 3)
b <- rep(c('X','Y','Z'),2)
year_mo <- c('98-10','99-4','99-10','00-4','00-10','01-04')
sep_df <- data.frame(a, b, year_mo)
sep_df 
#SEPARATE year_mo
#data, then what you want to sep, then how you sep, then with what
sep_df <- separate(sep_df, year_mo, c('year', 'month'), sep = '-')
sep_df
#NOW UNITE
#data, then what you call it, then with what columns, then with what symbols (if any)
unite_df <- unite(sep_df, year_mo, year, month, sep = '/')
unite_df
