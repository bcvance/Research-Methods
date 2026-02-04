library("qdapTools")
library("tidyr")
library("dplyr")
library("gridExtra")
library("ggplot2")
library("reshape2")
library("energy")
library("car")

data <- read.csv("LDT_L2.csv")
prof <- read.csv("L2ParticipantData.csv")

length(unique(data$subject))
length(unique(prof$subject))

data$Cloze <- lookup(terms = data$subject, key.match = prof$subject, key.reassign = 
                       prof$Cloze)

data$LexTale <- lookup(terms = data$subject, key.match = prof$subject, key.reassign = 
                         prof$LexTale)
head(data)
tail(data)

prof <- prof[,c(1:3)]

melted <- melt(data = prof, id.vars = "subject")

melted <- rename(melted, test = variable, score = value)

head(melted)
tail(melted)

ggplot(data = melted, aes (y = score)) + geom_boxplot() + facet_wrap(~test)

plot.cl <- ggplot(data = data, aes (y = Cloze)) + geom_boxplot() + ggtitle("Cloze")
plot.lt <- ggplot(data = data, aes(y = LexTale)) + geom_boxplot() + ggtitle(("LexTALE"))
grid.arrange(plot.cl, plot.lt, ncol = 2)