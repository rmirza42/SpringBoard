Exercise 2 Code:

> df1$embarked <- ifelse(is.na(df1$embarked), "S", df1$embarked)
> df1$age <- ifelse(is.na(df1$age), mean(df1$age, trim = 0, na.rm = TRUE), df1$age)
> 
> df1 <- df1 %>% select(pclass:home.dest) %>% mutate(has_cabin_number = ifelse(is.na(df1$cabin), 0, 1))
> df1$boat <- ifelse(is.na(df1$boat), "None", df1$boat)