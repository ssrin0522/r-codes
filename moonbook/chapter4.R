Height <- c(168, 173, 160, 145, 180)
result <- mean(Height)
result

mypower <- function(x) {
  result <- c(x^3)
  return(result)
}

mypower(3)

mypower3 <- function(x) {
  result <- x^3
  return(result)
}

mypower3(4)

1+2
'+'(1,2)

'*'(3,4)
'/'(9,2)

#2. control statement

mypower("moon")

mypower <- function(x) {
  if(is.numeric(x)) {
    result <- c(x^3)
  }
  else {
    result=NA
  }
  result
}
mypower(3)
mypower("moon")

## 2.2 ifelse()

mypower2 <- function(x) {
  ifelse(is.numeric(x), c(x^3), NA)
}
mypower2("moon")
mypower2(3)

x <-3
mypower(x)
mypower2(x)
x <- c(2,3,4)
mypower(x)
mypower2(x)

myfact <- function(x) {
  result <- 1
  for(i in 1:x) {
    result <- result*i
  }
  result
}
myfact(3)
myfact(5)

par(mfrow=c(2,2))
x <- list(1:6, sin, function(x) {x^2+2*x}, dnorm)
x
for(i in x) plot(i, xlim=c(0, 2*pi))
par(mfrow=c(1,1))

#2.4 while

i <- 1
while (i <5) {
  i=i+1
}
i

#2.5 break

i <-1
while(1) {
  if(i==5) break
  i=i+1
}
i

#2.6 next

oddSum <- 0
for(i in 1:100) {
  if(i%%2==0) next
  oddSum=oddSum+i
}
oddSum

#2.7 repeat
i <- 1
repeat {
  if(i==5) break
  i=i+1
}
i
