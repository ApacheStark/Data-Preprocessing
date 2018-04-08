### NOW FOR stringr() BABY
# install.packages('stringr')
library(stringr)

str_trim('   this is a test     ')
#removes spaces either side

str_pad('1234', width = 10, pad = '0', side = 'left')
#pads out the string, main use for IDs

str_detect(animals, 'ant')
#detects presence of string

str_replace(animals, 'ant', 'super cat')
#simply replace string with another

#character case manipulation
toupper('aabBsSN10002')
tolower('ANSNSOJ10')

vector <- str_replace_all(vector, 'replace', 'replace with')  #only a character vector
### REMEMBER: to reassign the vector to itself to actually apply its function
#from datacamp example
# Remove all periods in state column  (use \\. to dictate periods)
str_replace_all(att5$state, '\\.', '')


