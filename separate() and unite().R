
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
