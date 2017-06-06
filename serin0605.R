a <- c(1)
b <- c(1)
a==b
x <- c(80, 85, 70)
x
(x <- 5+2)
(x<-5/3)
ci <-6^2*pi
ci
8%%3
17%/%4

x<-c(1,2,3,4)
y<-c(2,3,4,5)
x+y
z<-c(1,2)
x+y
y*z
x*5
x*y
x*z
f<-c(1,2,3)
g<-c("rin","ji")
h<-c(f,g)
h*3
g*3
k <- 5<3
k
k2<-10==15
k2
y <-c(15,25,35)
z<- y>20
z

s<- seq(1,20)
s
s1<- seq(10,1)
s1
s2<- seq(2,10,by=2)
s2
s3 <-seq(18,2,by=-2)
s3
s4 <- seq(1,1000,length.out = 300)
s4

g<- c("rin","ji")
g
r <- rep(g,3)
r
r2 <- rep(g,each=3)
r2
r3 <- rep(1,10,time=3)
r3

i<- c(1:30)
i2 <- seq(30,1)
i3<- c(i,i2)
length(i3)

i3[32]
i3[c(4,7,50,53)]
i3[-c(15,30,45,58)]
i3[i3<15]
i3<15
i3[i3>12&i3<17]
i3[i3>27|i3<15]
