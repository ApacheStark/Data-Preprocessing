
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
