if(Sys.info()[["sysname"]] == "Darwin") { par(family="AppleGothic")}

plot(1:10, type="n", main="Mac에서 서체(fonts) 테스트", xlab="", ylab="")
text(1,8,"\"AppleGothic\"으로 설정한 경우", cex=1.5, pos=4)
text(1,7,"\"AppleMyungjo\"으로 설정한 경우", family="AppleMyungjo", cex=1.5, pos=4)
text(1,6,"\"NanumGothic\"으로 설정한 경우", family="NanumGothic", cex=1.5, pos=4)
text(1,5, "\"NanumMyeongjo\"으로 설정한 경우", family="NanumMyeongjo", cex=1.5, pos=4)
text(1,4,"\"Senggakdero\"로 설정한 경우", family="Senggakdero", cex=1.5, pos=4)

names(pdfFonts())

fontNo <- length(names(pdfFonts()))
plot(1:fontNo, type="n")
for(i in 1:fontNo) text(fontNo/2, i, names(pdfFonts())[i], family=names(pdfFonts())[i])

# 2. graphs

data(mtcars)
str(mtcars)

tail(mtcars)
plot(mtcars)

plot(mtcars$mpg)
plot(mpg~disp, data=mtcars)
plot(mpg~ factor(am), data=mtcars)

head(methods(plot), 10)
length(methods(plot))

coplot(mpg~disp | factor(am), data=mtcars)

# 4. basic usage of plot()

par(mfrow=c(2,2))
plot(1:10, main="default(type=\"p\")")
plot(1:10, type="l", main="type=\"l\"")
plot(1:10, type="b", main="type=\"b\"")
plot(1:10, type="c", main="type=\"c\"")
par(mfrow=c(1,1))

par(mfrow=c(2,2))
plot(1:10, type="o", main="type=\"o\"")
plot(1:10, type="h", main="type=\"h\"")
plot(1:10, type="s", main="type=\"s\"")
plot(1:10, type="n", main="type=\"n\"")
par(mfrow=c(1,1))

x <- rep(1:5, each=5)
y <- rep(5:1, 5)
plot(1:5, type="n", xlim=c(0, 7.5), ylim=c(0,5.5))
points(x, y, pch=1:25, cex=2)
text(x-0.5, y, labels=as.character(1:25), cex=1.5)
points(rep(6,5), 5:1, pch=65:69, cex=2)
text(rep(6,5)-0.5, 5:1, labels=as.character(65:69), cex=1.5)
pchs=c("&", "z", "M", "F", "가")
points(rep(7,5), 5:1, pch=pchs, cex=2)
text(rep(7,5)-0.5,5:1, labels=pchs, cex=1.5)

# 5. basic option : labels, xlab, xlim etc

par(mfrow=c(1,2))
plot(mpg~disp, data=mtcars)
plot(mpg~disp, data=mtcars, pch=21, col="black", bg=mtcars$am+2, cex=1.2,
     main="연비와 배기량",
     xlab="배기량", ylab="연비")
par(mfrow=c(1,1))

# 6. low level graphic function
# 6.1 points

plot(-4:4, -4:4, type="n", main="Examples of points()")
x <- rnorm(200)
y <- rnorm(200)
points(x, y, pch=ifelse(y<x, 8, 1), col=ifelse(y>x, "red", "blue"))
points(x, y, pch=ifelse(y<x, 1,8), col=ifelse(y>x, "red", "blue"))

# 6.2 lines
x <- 1:10
curve(x^2+x, xlim=c(1,10), ylim=c(1,200), main="Examples of curve() and lines()")
for (i in 0:6) lines(x, y=x^2+i*x+10*i, lty=i, lwd=i, col=i)
legend("topleft", legend=paste("lty", 0:6), lty=0:6, lwd=2, col=0:6)

# 6.3 abline, grid

fit <- lm(mpg~disp, data=mtcars)
plot(mpg~disp, data=mtcars, main="Examples of abline(), text()")
grid(10, col="darkgrey")
abline(fit, col="blue")
points(210, 30, pch=8, col="red", cex=1.2)
text(210, 30, paste("pos=", 1:4, sep=""), pos=1:4)
abline(v=300, lty=3, lwd=3, col=3)
text(300, 30, "v=300", col=3, pos=4)
abline(h=25, lty=2, lwd=2, col=2)
text(400, 25, "h=25", col=2, pos=3)

# 6.7 polygon

plot(1:10, type="n", main="segments(), polygon(), mtext()", xlab="", ylab="")
segments(c(2,4), 1:9, 5, lwd=2, col=1:3)
polygon(c(7,9,7,9,NA,9,7,9,7),1:9, density=c(10,20), angle=c(45,-45),col=2:3)
mtext(side=1, line=2, "mtext, side=1, line=2")
mtext(side=2, line=2, "mtext, side=2, line=2")
mtext(side=3, line=0.5, "mtext, side=3, line=0.5")
mtext(side=4, line=1, "mtext, side=4, line=1")

# 6.8 legend

plot(1:10, type="n", xlab="", ylab="", main="Examples of legend()")
legend=c("group A", "group B")
location=c("topleft", "top", "topright", "left", "center", "right", "bottomleft", "bottom", "bottomright")
for(i in 1:9) legend(location[i], legend, pch=1:2, col=1:2, title=location[i])
legend(2,8,legend, lty=1:2, col=1:2)
legend(7,8,legend, lty=1:2, pch=1:2, col=1:2)
legend(2,4,legend,fill=1:2, col=1:2)
legend(7,4,legend,fill=1:2, density=30)
legend(locator(1), legend="Locator", fill="red")

plot(mpg~disp, data=mtcars, pch=21, col="black", bg=mtcars$am+2, cex=1.2, 
     main="연비와 배기량",
     xlab="배기량", ylab="연비", xlim=c(0,500), ylim=c(0,40))
legend("topright", legend=c("automatic", "manual"), pch=21, col="black", pt.bg=2:3,
       cex=1,2)
text(100,10, "피타고라스의 정리")
text(100,7, labels=expression(italic(c^2==a^2+b^2)))
polygon(c(200,300,300), c(4,10,4))
polygon(c(290,290,300,300),c(4,5,5,4))
text(240,8.2,"c")
text(260,3,"a")
text(320,7.5,"b")
points(350,25,pch=8, col="red", cex=1.5)
text(350,25,paste("pos=", 1:4, sep=""), pos=1:4)
abline(h=20, col="green", lty=2)
abline(v=400, col="blue", lty=3)
lines(lowess(mtcars$mpg~mtcars$disp), lwd=2, col="red")
arrows(200,30,300,35, angle=30)
title(sub="subtitle")
mtext(side=1, line=2, "mtext, side=1, line=2")
mtext(side=2, line=2, "mtext, side=2, line=2")
mtext(side=3, line=0.5, "mtext, side=3, line=0.5")

#6.9
demo(plotmath)
