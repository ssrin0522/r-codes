iris

str(iris)
?iris

head(iris)
tail(iris, 10)

install.packages(c('moonBook', 'mycor'))

require(moonBook)
require(mycor)

plot(mycor(iris), type=2, groups=Species)
