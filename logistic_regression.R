## Exercise: logistic regression
## ───────────────────────────────────

##   Use the NH11 data set that we loaded earlier.

##   1. Use glm to conduct a logistic regression to predict ever worked
##      (everwrk) using age (age_p) and marital status (r_maritl).
##   2. Predict the probability of working for each level of marital
##      status.

##   Note that the data is not perfectly clean and ready to be modeled. You
##   will need to clean up at least some of the variables before fitting
##   the model.


## Exercise on logistic regression using NH11
#Look at structure of everwrk to see how many levels it contains
str(NH11$everwrk)
levels(NH11$everwrk)
#Replace all levels with NA apart from 1 Yes, and 2 No
NH11$everwrk <- factor(NH11$everwrk, levels = c("1 Yes", "2 No"))

#Look at structure of r_maritl, use droplevels to drop unused levels from a factor
str(NH11$r_maritl)
levels(NH11$r_maritl)
NH11$r_maritl <- droplevels(NH11$r_maritl)

#Predict ever worked using age and marital status
evr_wrk <- glm(everwrk ~ age_p + r_maritl,
               data=NH11, family="binomial")
summary(evr_wrk)

#Transform the coefficients to make them easier to interpret
evr_wrk.tab <- coef(summary(evr_wrk))
evr_wrk.tab[, "Estimate"] <- exp(coef(evr_wrk))
evr_wrk.tab

#Predict the probability of working for each level of marital status
library(effects)
data.frame(Effect("r_maritl", evr_wrk))
