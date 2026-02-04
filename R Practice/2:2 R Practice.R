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

agRT <- aggregate(data = data, RT ~ Condition, FUN = mean)
agRT$RT <- round(agRT$RT,0)

agr.all <- aggregate(data = data, RT ~ Condition + Related, FUN = mean)
agr.all$RT <- round(agr.all$RT, 0)

library("tidyr")

agr.all <- spread(data = agr.all, key = Related, value = RT)

agr.all$Effect <- agr.all$rel - agr.all$unrel
agr.all

agr.percent <- aggregate(data = data, Accuracy ~ Subject, FUN = mean)
agr.percent$Accuracy <- round(agr.percent$Accuracy, 2) * 100
agr.percent$Accuracy <- sort(agr.percent$Accuracy)
agr.percent

agr.acc <- aggregate(data=data, Accuracy ~ Condition + Related, FUN = mean)
agr.acc$Accuracy <- round(agr.acc$Accuracy, 2) * 100
agr.acc <- spread(data = agr.acc, key = Related, value = Accuracy)
agr.acc