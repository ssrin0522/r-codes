install.packages("plotrix")

# 벡터와 연산자

x <- c(80, 85, 70)
x 

c(80, 85, 70) -> x
x

x <- c(80)
x

x <- 80
x

x <- 5+2
x <- 5/3
x <- 5^2
x <- 5%%3
x

x <- 5%/%3
x

x <- c(1,2,3,4)
y <- c(2,3,4,5)
z <- c(1,2)

w <- x+y
w

w <- x+5
w

w <- y/2
w

w <- x+z
w

w <- x/z
w

w <- z/x
w

x <- c(1,2,3)
x

y <- c("A", "B", "C")
y

y <- c("A", 1, 2)
y

z <- y+1

x <- 5<3
x

y <- c(10,20,30)
z <- y<=10
z


x <- T
y <- F
x | y

x &y

x <- 3
!x

isTRUE(y)

z <- c(TRUE, FALSE, FALSE)
z|y


# sequence

x <- seq(1, 10)
x

x <- 1:10
x

x <- seq(10, 1)
x

y <- 10:1
y

x <- seq(1, 10, by=3)
x

y <- seq(1, 10, length.out=5)
y

# replicate

x <- c(1,2,3)
rep(x, times=2)

rep(x, each=2)

x <- c(1,2,3,4,5)

x[c(1,3,5)]
x[-c(2,4)]

x[x>2]

x[x>=2 & x<=4]

x[2] <- 20
x

x[c(3,4)] <- 15
x

x[x<=15] <- 10
x

# 함수를 이용한 벡터의 계산

x <- seq(1:10)
sum(x)

mean(x)

var(x)

sd(x)

sqrt(x)
var(x) ^ (1/2) == sd(x)

