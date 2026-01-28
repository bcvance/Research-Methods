setwd('/Users/b.vance/Library/CloudStorage/OneDrive-UniversityofKansas/Research Methods/R Files/R Drafts')

a <- 3
a
a + 5
b <- 7
b
b - 5
a + b
rm(b)
is(a)
class(a)

fibonacci10 <- c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55)
fibonacci10

vnum <- 1:5
vnum

vnum1 <- c(1:5, 10, 5)
vnum1

vnum2 <- seq(0, 100, 10)
vnum2

vnum3 <- rep(1:5, 3)
vnum3

summary(fibonacci10)

sort(vnum1)

sort(vnum1, decreasing=TRUE)

vnum1

vnumX <- sort(vnum1)

vnumX

length(vnum1)

vnum1[c(3, 6)]

vnum1[c(-1)]

vnum1[vnum1 > 2]

vnum1[vnum1 != 5]

vnum1[vnum1 < 3 | vnum1 == 10]

vnum1[vnum1 > 4 & vnum1 < 10]

which(vnum1 == 5)

w <- c(20, 30, 40)

y <- c(vnum1, w)
y

sum(vnum1)

vnum1 + 3

vnum1 * 2

vnum1 ^ 2

log(vnum1)

round(log(vnum1), 2)

vnum1square <- vnum ^ 2
vnum1square

stein <- c("a", "rose", "is", "a", "rose", "is", "a", "rose")
stein

charv <- c("do", "re", "mi", "do")
charv

which(charv == "do")

grep("do", charv)

gsub("m", "t", charv)
# doesn't alter original vector
charv

paste(charv, "!", sep = "")

charv.excl <- paste(charv, "!", sep="")
charv.excl

#Factors

fac <- as.factor(charv)
fac

str(fac)

levels(fac)

table(fac)

summary(fac)
