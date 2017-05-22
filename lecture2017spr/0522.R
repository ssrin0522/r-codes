data(mtcars)
head(mtcars, 10)
str(mtcars)


# 자료 요약 및 확인
summary(mtcars)

mtcars$mpg
mtcars[["mpg"]]
mtcars["mpg"]

mtcars
rownames(mtcars)
k <- data.frame(t(mtcars))

stem(mtcars$mpg)

hist(mtcars$mpg)
boxplot(mtcars$mpg)
plot(mtcars)
fivenum(mtcars$mpg)
quantile(mtcars$mpg)

order(mtcars$mpg)

mtcars <- mtcars[order(mtcars$mpg),]
head(mtcars)

rownames(mtcars)

order(rownames(mtcars))

mtcars <- mtcars[order(rownames(mtcars)),]
mtcars <- mtcars[order(mtcars$mpg, mtcars$wt),]
mtcars
head(mtcars)

# subset

data(mtcars)
table(mtcars$cyl)
mtcars$cyl <7
mtcars1 <- mtcars[mtcars$cyl <7,]
table(mtcars$cyl)

mtcars1 <- subset(mtcars, subset=cyl<7)
mtcars1

mtcars2 <- subset(mtcars1, select=c(mpg,cyl))
mtcars2

mtcars3 <- subset(mtcars1, subset=cyl==4, select=mpg)
mtcars3

mtcars4 <- subset(mtcars1, subset=cyl==4, select=cyl)
mtcars4

cbind(mtcars3, mtcars4)

# rbind
mtcars5 <- subset(mtcars2, mpg<21)
mtcars5

mtcars6 <- mtcars2[mtcars2$mpg>21,]
mtcars6

rbind(mtcars5, mtcars6)

name <- c("김철수", "이영희", "홍길동")
국어 <- c(90, 95, 80)
수학 <- c(100,95,85)

성적1 <- data.frame(name, 국어)
성적2 <- data.frame(name, 수학)

성적 <- merge(성적1, 성적2, by="name")

name <- c(name, "문건웅")
과학 <- c(80, 85, 90, 100)
성적3 <- data.frame(name, 과학)
성적3

cbind(성적, 성적3)

merge(성적, 성적3, by='name')
merge(성적, 성적3, by='name', all=T)

# summary of data

table(mtcars$cyl)
help(mtcars)
table(mtcars$cyl, mtcars$am)

mtcars$tm <- factor(mtcars$am, labels=c("automatic", "manual"))
# mtcars$tm <- ifelse(mtcars$am==0, "automatic", "manual)
table(mtcars$tm)

str(mtcars)
result <- table(mtcars$cyl, mtcars$tm)
result

chisq.test(result)
plot(result)
barplot(result, legend=paste(rownames(result), "cyl"))

result1 <- xtabs(~cyl+tm, data=mtcars)
result1

addmargins(result1)
chisq.test(result1)

# mean

plot(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean) # 평균구할 변량, 평균의 기준, 명령어

aggregate(mpg~cyl, data=mtcars, mean)
aggregate(mpg~cyl+am, data=mtcars, mean)

# 엔진수에 따른 엔진출력(마력) 평균

tapply(mtcars$hp, mtcars$cyl, mean)

plot(mpg~cyl, data=mtcars)
boxplot(mpg~cyl, data=mtcars)
out <- lm(mpg~factor(cyl), data=mtcars)
anova(out)

# 결측값 처리

Height <- c(168, 173, 160, 145, NA, 180)
mean(Height)
mean(Height[!is.na(Height)])
mean(Height, na.rm=T)

# 상관분석, 회귀분석

#마력과 연비
cor.test(mtcars$mpg, mtcars$hp)

with(mtcars, cor.test(mpg,hp))

plot(mpg~hp, data=mtcars)
out1 <- lm(mpg~hp, data=mtcars)
summary(out1)

abline(out1, col="red")


# 연속형 자료의 변형

library(tidyverse)
data(diamonds)
str(diamonds)

summary(diamonds)

diamonds$PriceGroup <- 1
diamonds$PriceGroup[diamonds$price >=1000] <- 2
diamonds$PriceGroup[diamonds$price >= 5000] <- 3
table(diamonds$PriceGroup)

diamonds$PriceGroup <- ifelse(diamonds$price<1000, 1, ifelse(diamonds$price<5000, 2, 3))
table(diamonds$PriceGroup)

diamonds$PriceGroup <- cut(diamonds$price, breaks=c(0, 999, 4999, 99999), labels=c(1,2,3))
table(diamonds$PriceGroup)

rank2group <- function(y, k=4) {
  count=length(y)
  z=rank(y, ties.method="min")
  return(floor((z-1)/(count/k))+1)
}

diamonds$PriceGroup <- rank2group(diamonds$price, 4)
table(diamonds$PriceGroup)

diamonds$PriceGroup3 <- rank2group(diamonds$price, 3)
table(diamonds$PriceGroup3)

aggregate(price~PriceGroup3, data=diamonds, range)

diamonds$PriceGroup5 <- rank2group(diamonds$price, 5)
table(diamonds$PriceGroup5)
aggregate(price~PriceGroup5, data=diamonds, range)
