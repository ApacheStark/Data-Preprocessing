
## EXTRA MUTATE
# Change columns to numeric using dplyr (don't change)
library(dplyr)
example <- mutate_each(att5, funs(as.numeric), -state)
#mutate_each() simply takes a df, then a function as funs(), and then any exclusions
