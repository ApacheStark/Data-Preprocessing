# string manipulation

animals <- c('horse', 'giraffe', 'octopus', 'owl', 'manitee', 'ant')


# FOR PATTERN RECOGNITION
# grepl() to find patterns letters in word
a <- grepl(pattern = 'a', x = animals)
animals[a]

# use ^ to determine if the word starts with 
start <- grepl(pattern = '^a', x = animals)
animals[start]
# and $ at the end for ending with
end <- grepl(pattern = 'e$', x = animals)
animals[end]

# ?regex will show more possibiities!


# simply grep() will give numeric order (not logical order)
grep(pattern = 'a', x = animals)
# same as
which(grepl(pattern = 'a', x = animals))


# FOR PATTERN RECOGNITION AND REPLACEMENT
# use sub()
sub(pattern = 'e', replacement = 'pants', x = animals)

# look at manitee, only the first e has been replaced, for both use gsub()
gsub(pattern = 'e', replacement = 'pants', x = animals)
#pants pants

#for more replacement, use a pipe |
gsub(pattern = 'r|e|f', replacement = 'ARGH', x = animals)


# e-mail example #

emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = '@.*\\.edu', emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep('@.*\\.edu', emails)

# Subset emails using hits
emails[hits]

###            Straight from Datacamp, advanced string pattern recognition
#   .*:   A usual suspect! It can be read as "any character that is matched zero or more times".
#   \\s:   Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
#   [0-9]+:   Match the numbers 0 to 9, at least once (+).
#   ([0-9]+):   The parentheses are used to make parts of the matching string available to define the replacement. 
# The \\1 in the replacement argument of sub() gets set to the string that is captured by the regular expression [0-9]+.
 
awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")
sub('.*\\s([0-9]+)\\snomination.*$', '\\1', awards)
#only selects all numbers in front of nominations
