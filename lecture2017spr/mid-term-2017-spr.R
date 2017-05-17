install.packages("tidyverse")
library(tidyverse)

subway <- read_csv("subway.csv")
names(subway)

names(subway) <- c("date", "line", "station", "ent.people", "exit.people", "reg.date")
subway_30 <- subway[1:30,]
gc_line <- filter(subway, line=="경춘선")
gc_7000 <- filter(gc_line, ent.people > 7000)
subway_r <- subset(subway, select=-reg.date)
subway_r <- subset(subway_r, select=-date)
avg_gc <- mean(gc_line$ent.people)

data(mtcars)
k <- filter(mtcars, disp > 150)
k <- filter(k, wt > 3)

plot(mtcars$mpg, mtcars$disp)
mean(mtcars$mpg) - mean(k$mpg)

data(iris)
ir <- subset(iris, select=-Species)
mean(ir$Sepal.Length) - mean(ir$Sepal.Width)

seto <- filter(iris, Species=="setosa")
versi <- filter(iris, Species=="versicolor")
mean(seto$Petal.Length, na.rm=T)
mean(versi$Petal.Length, na.rm=T)
