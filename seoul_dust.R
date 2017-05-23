dust <- read.csv("서울dust.csv")
colnames(dust)
colnames(dust) <- c("date", "place", "co2", "ozone", "co", "ch2", "tinydust", "stinydust")


library(tidyverse)

group_dust <- dust %>% 
  group_by(place, tinydust) %>% 
  summarise(M = mean(tinydust, na.rm=T),
            SE = sd(tinydust, na.rm=T) / sqrt(length(na.omit(tinydust))),
            N = length(na.omit(tinydust)))


ggplot(group_dust, aes(x=M, xmin=M-SE, xmax=M+SE, y= place)) + 
  geom_point()


plot(group_dust$place)
