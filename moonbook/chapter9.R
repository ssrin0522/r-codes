#9.1 표를 만드는 세 가지 방법: table(), xtabs(), prop.table()

data(mtcars)
(result <- table(mtcars$cyl))

prop.table(result)
prop.table(result)*100

table(mtcars$cyl, mtcars$am)

mtcars$tm <- factor(mtcars$am, labels=c("automatic", "manual"))
table(mtcars$cyl, mtcars$tm)

mtcars$tm <- ifelse(mtcars$am==0, "automatic", "manual")
table(mtcars$cyl, mtcars$tm)

result <- table(mtcars$cyl, mtcars$tm)
result

addmargins(result) # sum 추가

#9.1.2 두번째 방법: xtabs() 이용

result1 <- xtabs(~cyl+tm, data=mtcars)
result1

plot(result1)
plot(result)

#9.2 카이제곱검정, 피셔검정

chisq.test(result)
fisher.test(result)

#9.3 모자이크 플롯 mosaicplot()

plot(result)

mosaicplot(result, color=c("tan1", "firebrick2"))

t(result)
mosaicplot(t(result))

colors()
demo("colors")

#9.4 Cochran-Armitage Trend Test

require(moonBook)
data(acs)

(result=table(acs$HBP, acs$smoking))

round(prop.table(result)*100, 2)

acs$smoking <- factor(acs$smoking, levels=c("Never", "Ex-smoker", "Smoker"))
str(acs$smoking)

(result <- table(acs$HBP, acs$smoking))
result[2,]

colSums(result)

res <- prop.trend.test(result[2,], colSums(result))
res

plot(t(result), col=c("deepskyblue", "brown2"), main="Hypertension and Smoking", ylab="Hypertension", xlab="Smoking")

mytable(smoking~age, data=acs)

#9.5 바플롯 barplot()

result <- table(mtcars$cyl, mtcars$tm)
barplot(result)
barplot(t(result))

barplot(result, legend=rownames(result), ylim=c(0,20))

mylegend=paste(rownames(result), "cyl")
barplot(result, legend=mylegend, ylim=c(0,20))

barplot(result, legend=mylegend, beside=T)
barplot(result, legend=mylegend, beside=T, horiz = T)
barplot(result, legend=mylegend, horiz=T)

mycol=c("tan1", "coral2", "firebrick2")
barplot(result, legend=mylegend, beside=T, col=mycol)

barplot(result, beside=TRUE, col=mycol)
abline(h=1:12, col="white", lwd=2)
legend("topright", legend=mylegend, fill=mycol)

barplot(t(result), beside=T, legend=rownames(t(result)), args.legend=list(x="top"))

#9.5.1 quiz

blue=rbind(c(5,3,4,3), c(3,2,5,1))
blue

dimnames(blue) <- list(c("A", "B"), c("t1", "t2", "t3", "t4"))
red <- rbind(c(1.7, 3.5, 1.6, 1.1), c(2.1, 1.0, 1.7, 0.5))
dimnames(red) <- list(c("A", "B"), c("t1", "t2", "t3", "t4"))
red

par(mfrow=c(1,2))
barplot(blue, col=c("lightblue", "blue"), ylim=c(0,10))
barplot(red, col=c("salmon", "red"), ylim=c(0,10))
par(mfrow=c(1,1))

#9.5.1.1 quiz solve

barplot(blue, col=c("lightblue", "blue"), ylim=c(0,10), xlim=c(0,9), space=c(0,1,1,1), axisnames = F)
barplot(red, col=c("salmon", "red"), ylim=c(0,10), add=T, space=c(0.5, 1,1,1), axes=F)

#9.6 spineplot()

result <- table(acs$sex, acs$HBP)
result

par(mfrow=c(1,2))
barplot(t(result), main="Stacked Bar Plot")
spineplot(result, main="Spineplot", ylab="Presence of Hypertension")
par(mfrow=c(1,1))

#9.7 데이터의 요약: tapply(), aggregate()로 평균 구하기

mean(acs$TC)
mean(acs$TC, na.rm=T)

mytable(Dx~TC, data=acs)

tapply(acs$TC, acs$Dx, mean, na.rm=T)
tapply(acs$TC, acs$Dx, sd, na.rm=T)

aggregate(TC~Dx, data=acs, mean)
aggregate(TC~Dx, data=acs, sd)

str(tapply(acs$TC, acs$Dx, mean, na.rm=T))

myfun <- function(x) {
  result=c(mean(x), sd(x))
}
aggregate(TC~Dx, data=acs, myfun)

#9.7.1 무기명 함수

aggregate(TC~Dx, data=acs, function(x) c(mean(x), sd(x)))

aggregate(cbind(TC, TG, HDLC, LDLC)~Dx, data=acs, function(x) c(mean(x), sd(x)))

aggregate(cbind(TC, TG)~Dx+sex, data=acs, function(x) c(mean(x), sd(x)))

mytable(sex+Dx~TC+TG, data=acs)

### aggregate와 mytable은 formula가 반대로 되어 있다

#9.8 boxplot

boxplot(TC~sex, data=acs)
boxplot(TC~Dx, data=acs)

#9.9 boxplot 변신과 활용

require(moonBook)
acs$Dx <- factor(acs$Dx, levels=c("Unstable Angina", "NSTEMI", "STEMI"))
boxplot(TG~Dx, data=acs)

acs$Dx

boxplot(TG~Dx, data=acs, ylim=c(0,400))
boxplot(TG~Dx, varwidth=T, notch=T, data=acs, ylim=c(0,400))

boxplot(TG~Dx, varwidth=T, notch=T, outline=F, data=acs, ylim=c(0,400))

boxplot(TG~Dx+sex, varwidth=T, notch=T, outline=F, data=acs, ylim=c(0,400))

boxplot(TG~Dx+sex, varwidth=T, notch=T, outline=F, data=acs, ylim=c(0,400),
        col=c(rep("yellow",3), rep("orange", 3)))
legend(3, 380, c("Male", "Female"), fill=c("yellow", "orange"))

# 여자 남자 단위로 따로 그리기
boxplot(TG ~ Dx, data=acs, boxwex = 0.3, at=1:3-0.2, notch=T, outline=F,
        subset=sex=="Female", col="yellow", xlim=c(0.5, 3.5), ylim=c(0,400), varwidth=T, yaxs="i")
boxplot(TG ~ Dx, data=acs, varwidth=T, add=T, outline=F, axes=F,
        boxwex=0.3, at=1:3+0.2, notch=T,
        subset=sex=="Male", col="orange")
legend(1.7, 380, c("Female", "Male"), fill=c("yellow", "orange"))
abline(h=150, lty="dashed", col="red")

# 축 옮기기

boxplot(TG ~ Dx, data=acs, boxwex = 0.3, at=1:3-0.2, notch=T, outline=F,
        subset=sex=="Female", col="yellow", axes=F,
        xlim=c(0.5, 3.5), ylim=c(0,400), varwidth=T, yaxs="i")
boxplot(TG ~ Dx, data=acs, varwidth=T, add = T, outline=F, axes=F,
        boxwex = 0.3, at=1:3+0.2, notch=T,
        subset=sex=="Male", col="orange")
legend(2.5, 380, c("Female", "Male"), fill=c("yellow", "orange"))
abline(h=150, lty="dashed", col="red")
box()
axis(side=2,) ##y축
axis(side=1, at=c(1,2,3), labels=levels(acs$Dx)) ##x축
mtext("Diagnosis", side=1, line=2.2) ## y축 라벨
mtext("Serum Triglyceride level(mg/dL)", side=2, line=2.2) ## x축 라벨

# sex와 Dx 순서를 바꿔서 편하게 그리는 방법
boxplot(TG~sex+Dx, varwidth=T, notch=T, outline=F, data=acs, ylim=c(0,400),
        col=c(rep(c("yellow", "orange"),3)), axes=F)
box()
axis(side=2, )
axis(side=1, at=c(1.5, 3.5, 5.5), labels=levels(acs$Dx))
legend(4.5, 390, c("Female", "Male"), fill=c("yellow", "orange"))
abline(h=150, lty="dashed", col="red")
mtext("Diagnosis", side=1, line=2.2)
mtext("Serum Triglyceride level(mg/dL)", side=2, line=2.2)
