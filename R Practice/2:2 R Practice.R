data <- read.csv("720-data.csv")

str(data)
summary(df)
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
levels(data$Related)
head(data)

data.L2 <- data[data$Group == "L2", ]
head(data.L2)
data.L2 <- data.L2[order(data.L2$Item, data.L2$Subject), ]
head(data.L2)

write.csv(data.L2, "L2-data.csv")