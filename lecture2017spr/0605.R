library(tidyverse)
mpg

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy))

mpg$drv
str(mpg)
mpg$drv

ggplot(mpg) +
  geom_point(aes(x=hwy, y=cyl))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy, color=class))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy, size=class))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy, alpha=class))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy, shape=class))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy), color="blue")

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy, color="blue"))

#11-2-5

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy))

ggplot(mpg) +
  geom_smooth(aes(x=displ, y=hwy))

ggplot(mpg) +
  geom_smooth(aes(x=displ, y=hwy, linetype=drv))
              
ggplot(mpg) +
  geom_smooth(aes(x=displ, y=hwy, color=drv)) +
  geom_point(aes(x=displ, y=hwy))

ggplot(mpg) +
  geom_smooth(aes(x=displ, y=hwy))

ggplot(mpg) +
  geom_smooth(aes(x=displ, y=hwy, group=drv))

ggplot(mpg) +
  geom_point(aes(x=displ, y=hwy)) +
  geom_smooth(aes(x=displ, y=hwy))

ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth()

ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point(aes(color=class)) +
  geom_smooth()

# 11-2-5-1

ggplot(mpg, aes(x=displ, y=hwy, color=drv)) +
  geom_point() +
  geom_smooth(se=F)

ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(mpg, aes(x=displ, y=hwy)) +
  geom_smooth(mpg, aes(x=displ, y=hwy))

