states.data <- readRDS("linear_regression/dataSets/states.rds")
states.info <- data.frame(attributes(states.data)[c("names", "var.labels")])
enrgy.metro <- subset(states.data, select = c("energy", "metro"))
summary(enrgy.metro)
cor(enrgy.metro)
plot(enrgy.metro) 
enrgy.model <- lm(metro ~ energy, data = na.omit(states.data))
summary(enrgy.model)
plot(enrgy.model)

#Best model with the new additional predictors:
enrgy.model3 <- lm(energy ~ toxic + green + area, data = na.omit(states.data))
summary(enrgy.model3)

# Adding interaction terms and region
enrgy.model3 <- lm(energy ~ toxic + green + area + region, data = na.omit(states.data))
summary(enrgy.model3)
