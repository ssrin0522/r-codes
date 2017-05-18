# 1. quiz

a <- 1:100
a[80:90]

a <- c(1,2,3)
b <- c(2.1, "kim")
c <- c(a,b,b,a)
c[10]

x <- matrix(1:12, ncol=3);x

Height <- c(173, 154, 160)
Weight <- c(78, 60, 45)

BMI <- Weight/((Height/100)^2)

hwb <- data.frame(Height, Weight, BMI)

# 2. R에서 쓰는 에서 쓰는 표현식, 연산자

# 2.1

r <- 2
circle <- pi*r^2
circle

r==2
r <-3
r==2

r!=2

a=b=c=d=2
a+b+c+d

a<-b<-c<-d<-3
a+b+c+d

total <- 2680; n <- 31
average <- total/n
average

# 3

5**2
10%%3
10%/%3

d <- (1+2)*3
d

print(d)
e <- d-7
(e)
(e=d-7)

# 4 kind of datum in R

# 6 adding data to variables

a <- c(1,2,3,10,6)
mode(a)
str(a)
dim(a)

b <- c(7,6)
a <- c(a,0)
c <- c(a,b,7,-5)
c

length(c)
c[2]

(b <- 1:20)
b <- seq(1,20)
seq(5)
seq(1,3,0.25)

e <- c(1,2,3)
f <- rep(e, 3)
f

a <- c(1,2,3)
b <- c(2.1, "Kim")
c <- c(a,b,b,a)
mode(c)
mode(a)
c[10]

x<-1
x
mode(x)

mode(x) <- "character"
x
y <- as.numeric(x)-1
y
as.logical(y) # FALSE = 0

# 7. NA and NULL

a <- as.numeric("Kim")
a

a <- c()
a

a <- c(1,2,3,NA,8,NA,10)
mean(a)
mean(a, na.rm=T)

sum(is.na(a))
sum(!is.na(a))

a <- c(a, NULL, 8, NULL);a
(a <- c(a, NA))

(a <- NULL)

# 8. data structure

a <- 1:5
a <- c(a, 101, 102)
b <- c(a,103)
b

Height <- c(168, 173, 160, 145, 180)
Weight <- c(80, 65, 92, 53, 76)
BMI <- Weight/(Height/100)^2
BMI
hwb <- cbind(Height, Weight, BMI)
hwb <- data.frame(hwb)

a <- 1:10
b <- c(1, -1)
a+b

b <- 10
a <- c <- 2
b^2+c(1,-1)*4*a*c #근의공식

#8.2 matrix

a <- matrix(1:12, ncol=3) ; a
a <- matrix(1:12, ncol=3, byrow=T) ; a
b <- LETTERS[1:12];b
b <- matrix(b, ncol=4); b

b[3,2]
b[2,4]
b[2,]
b[,3]
length(b)
nrow(b);ncol(b)

#8.3 factor

sex <- c("Male", "Female", "Female", "Male", "Male")
sex <- factor(sex)
sex
str(sex)
levels(sex)
length(sex)

smoking <- c(1,1,2,3,1)
smoking <- factor(smoking)
levels(smoking) <- c("none", "ex-smoker", "smoker")
smoking

#8.6 data.frame

mydata <- data.frame(height=Height, weight=Weight, sex=sex, smoking=smoking)
mydata
mydata <- data.frame(mydata, BMI)

mydata[3,]
mydata[,1]

mydata$height
mydata[["height"]]

mydata[3]
mydata[[3]]
str(mydata[3]) #data.frame
str(mydata[[3]]) #vector

mydata$BMI <- mydata$weight*10000/(mydata$height)^2
mydata
str(mydata)

summary(mydata)
plot(mydata)
