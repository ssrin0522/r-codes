#10.1 One-sampe t-test

x <- c(15.5, 11.21, 12.67, 8.87, 12.15, 9.88, 2.06, 14.50, 0, 4.97)
mean(x)
sd(x)
shapiro.test(x)

t.test(x, mu=8.1)

t.test(x, mu=8.1, conf.level = 0.99, alter="greater")

#10.2 paired t-test vs wilcoxon signed-rank test

data(sleep)
head(sleep)

str(sleep)

with(sleep, 
     shapiro.test(extra[group == 2] - extra[group == 1]))

with(sleep,
     wilcox.test(extra[group == 2] - extra[group == 1]))

with(sleep,
     wilcox.test(extra[group == 2] - extra[group == 1], exact=F))

with(sleep,
     t.test(extra[group == 1],
            extra[group == 2], paired= T))

sleep1 <- with(sleep, extra[group == 2] - extra[group == 1])
summary(sleep1)

stripchart(sleep1, method="stack", xlab="hours",
           main="Sleep prolongation (n=10)")
boxplot(sleep1, horizontal = T, add=T,
        at=.6, pars=list(boxwex = 0.5, staplewex=0.25))

#10.3 두 군 또는 세 군에서의 평균의 비교: 전통적인 R의 방법

#10.3.1 두 군데에서의 평균의 비교

library(moonBook)

boxplot(age~sex, data=acs, col=c("brown2", "deepskyblue"))

var.test(age~sex, data=acs)

#분산이 같을 경우
t.test(age~sex, data=acs, var.equal=T)

#분산이 다를 경우
t.test(age~sex, data=acs)

#10.3.2 세 군 이상에서의 평균 비교

aggregate(age~Dx, data=acs, function(x) {c(mean(x), sd(x))})

boxplot(LDLC~Dx, data=acs)
densityplot(age~Dx, data=acs)

out <- aov(LDLC~Dx, data=acs)
summary(out)

#10.3.2.1 다중비교

TukeyHSD(out)
plot(TukeyHSD(out))

#10.3.2.2 par() 함수의 인수 조절

par(las=1)
plot(TukeyHSD(out))
par(las=0)

par(las=1)
par(mar=c(5,12,4,2))
plot(TukeyHSD(out))
par(mar=c(5,4,4,2))
par(las=0)

#10.3.2.3 통계 가설의 검정

library(car)
qqPlot(lm(LDLC~Dx, data=acs), main="qqPlot", simulate=T, labels=T)

shapiro.test(resid(out))

nortest::ad.test(resid(out))

bartlett.test(LDLC~Dx, data=acs)

outlierTest(out)

#10.4 비모수 검정

#4.1 Wilcoxon Rank-Sum Test

densityplot(age~sex, data=acs)
out <- lm(age~sex, data=acs)
shapiro.test(resid(out))

wilcox.test(age~sex, data=acs)

#4.2 Kruskal-Wallis Rank Sum Test
##비모수 통계일 때 사용

kruskal.test(LDLC~factor(Dx), data=acs)

#4.3 비모수 검정에서의 다중비교
require(nparcomp)
result <- mctp(LDLC~Dx, data=acs)

summary(result)

par(las=1)
par(mar=c(5,12,4,2))
plot(result)
par(mar=c(5,4,4,2))
par(las=0)

pairwise.wilcox.test(acs$LDLC, acs$Dx, p.adj="bonferroni")

#10.5 mytable 함수를 쓰는 경우

mytable(Dx~LDLC, data=acs, method=3)
