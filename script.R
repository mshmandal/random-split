# Randomly sample number of rows from dataframe in R


# first create a dummy dataframe
df <- data.frame(
  id = c(1:2000),              # first column
  age= rnorm(2000,35,15),      # second column
  income=rnorm(2000,5000,2000) # third column
)

class(df) # check our newly data, this is a data.frame class object


# Method 1 ----------------------------------------------------------------
n <- 500 # total numbers to extract

set.seed(1) # set seed
new_df <- df[sample(nrow(df), n,replace = F), ] # subset rows using sample() function
barplot(table(new_df$id))  # no repetition due to replace argument FALSE

set.seed(2)
new_df1 <- df[sample(nrow(df), n,replace = T), ] # with replacement
barplot(table(new_df1$id)) # number of times sample repetition for ids


# Method 2 ----------------------------------------------------------------
library(dplyr) # using dplyr package

set.seed(3)
new_df2 <- sample_n(df,size = n,replace = F) # sample rows randomly
barplot(table(new_df2$id))

set.seed(4)
new_df3 <- sample_frac(tbl = df,0.50) # sample 50% of the data
length(new_df3$id)
new_df3

