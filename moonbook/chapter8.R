library(moonBook)

#누락된 자료 확인

na.count <- apply(acs, 2, function(x) sum(is.na(x)))
na.count[na.count>0]

barplot(na.count[na.count>0])

#8.2 누락된 자료 패턴 분석

install.packages("VIM")

VIM::aggr(acs, prop=F, numbers=T)
VIM::marginplot(acs[c("EF", "BMI")], pch=20, col=c("darkgray", "red", "blue"))

x <- as.data.frame(abs(is.na(acs)))
y <- apply(x, 2, function(x) sum(x)>0)
round(cor(x[y]), 2)

#8.3 Missing Data의 종류

### MCAR(missing completely at random)
### MAR(Missing at random)
### MNAR(Missing at not random)
## 누락된 변수의 값과 누락된 이유가 관련이 있는 경우

#8.4 누락 자료에 대한 rational approach
#8.5 Listwise deletion vs Pairwise deletion

nrow(acs)
acs1 <- na.omit(acs)
nrow(acs1)

cor(acs$EF, acs$BMI)
res1 <- round(cor(acs1$EF, acs1$BMI), 4)
res1

acs2 <- na.omit(acs[c("EF", "BMI")])
nrow(acs2)

res2 <- round(cor(acs2$EF, acs2$BMI), 4); res2

cor(acs$EF, acs$BMI, use="pairwise.complete.obs")

tableacs <- data.frame("방법"=c("전체", "listwise deletion", "pairwise deletion"), 
           "대상환자수"=c(nrow(acs), nrow(acs1), nrow(acs2)),
           "r값"=c(cor(acs$EF, acs$BMI), cor(acs1$EF, acs1$BMI), cor(acs2$EF, acs2$BMI)))

#8.5.1 단순회귀분석의 경우

fit <- lm(EF~BMI, data=acs)
summary(fit)

fit2 <- lm(EF~BMI, data=acs2)
summary(fit2)

identical(fit$coefficients, fit2$coefficients)

#8.5.2 장단점

round(cor(acs[c("EF", "BMI", "LDLC")], use="pairwise.complete.obs"),3)

#8.6 다중대입법(multiple imputation, MI)
library(mice)

data(iris)
fit <- lm(Sepal.Length~Petal.Length+Species, data=iris)
summary(fit)

iris1 <- iris
set.seed(123)
random1 <- sample(1:150, 10)
random2 <- sample(1:5, 10, replace=T)

for(i in 1:10) iris1[random1[i], random2[i]] <- NA
iris1[random1,]
iris[random1,]

imp <- mice(iris1, seed=1234)

fit1 <- with(imp, lm(Sepal.Length~Petal.Length+Species))
pooled = pool(fit1)
summary(pooled)

imp

imp$imp

iris[random1,]

#8.8 퀴즈: NA값을 평균값으로 입력하기
#8.8.1

mat <- matrix(sample(100, size=60, replace=T), nrow=6)
mat[4,2]=NA
mat[2,7]<-NA
mat

apply(mat, 2, function(x) { x[is.na(x)]=mean(x, na.rm=T);x})
