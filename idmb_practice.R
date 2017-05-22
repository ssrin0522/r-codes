library(tidyverse)
library(ggthemes)

idmb <- read_csv('imdb-5000-movie-dataset/movie_metadata.csv')
idmb <- read.csv('imdb-5000-movie-dataset/movie_metadata.csv')

idmb %>% 
  filter(country=="Japan" | country =="South Korea" | country == "UK" | country =="USA") %>% 
  group_by(country) %>% 
  summarise(mean = mean(budget, na.rm=T))
  
str(idmb)

ratingdat <- idmb %>% 
  group_by(actor_1_name) %>% 
  summarise(M = mean(imdb_score, na.rm=T), 
            SE = sd(imdb_score, na.rm=T)/sqrt(length(na.omit(imdb_score))),
            N = length(na.omit(imdb_score)))

ratings <- filter(ratingdat, N>=15)

ratings$actor_1_name <- factor(ratings$actor_1_name)
ratings$actor_1_name <- reorder(ratings$actor_1_name, ratings$M)


ggplot(ratings, aes(x = M, xmin = M-SE, xmax = M+SE, y = actor_1_name )) +
  geom_point() + 
  geom_segment( aes(x = M-SE, xend = M+SE,
                    y = actor_1_name, yend=actor_1_name)) +
  theme(axis.text=element_text(size=8)) +
  xlab("Mean rating") + ylab("First Actor") 

