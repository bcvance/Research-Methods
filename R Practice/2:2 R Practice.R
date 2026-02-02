data <- read.csv("720-data.csv")

str(data)
head(df)
dim(data)

data$Condition <- as.factor(data$Condition)
data$Related <- as.factor(data$Related)
data$Group <- as.factor(data$Group)

data <- data[data$Condition != "Nonce", ]

data$logRT <- log(data$RT)
head(data)

levels(data$Related)
levels(data$Related) <- c("rel", "unrel")
head(data)

data.L2 <- data[data$Group == "L2", ]
head(data.L2)
data.L2 <- data.L2[order(data.L2$Item, data.L2$Subject), ]
head(data.L2)

write.csv(data.L2, "L2-data.csv")

#Additional Practice

summary(data$RT)

data <- data[data$RT > 299 & data$RT < 2001, ]
summary(data)

hist(data$RT)

data$LogRT <- log(data$RT)
head(data)
hist(data$LogRT)

agRT <- aggregate(data = data, RT ~ Condition, FUN = mean)
agRT