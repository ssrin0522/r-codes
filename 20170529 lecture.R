install.packages("KoNLP")
install.packages("wordcloud")
install.packages("tidyverse")
install.packages("rJava")

library(rJava)
library(KoNLP)
library(tidyverse)
library(wordcloud)

# 사전 불러오기
useSejongDic()

data1 <- readLines("seoul_new.txt", encoding = "UTF-8")
data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
head(unlist(data2), 30)

data3 <- unlist(data2)
data3 <- gsub("\\d+", "", data3)
data3 <- gsub("서울시", "", data3)
data3 <- gsub("요청", "", data3)
data3 <- gsub("제안", "", data3)
data3 <- gsub(" ", "", data3)
data3 <- gsub("-", "", data3)
data3

write(unlist(data3), "seoul_2.txt")

data4 <- read.table("seoul_2.txt")
data4
head(data4)
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 20)

data3

data3 <- gsub("OO", "", data3)
data3 <- gsub("개선", "", data3)
data3 <- gsub("문제", "", data3)
data3 <- gsub("관리", "", data3)
data3 <- gsub("님", "", data3)
data3 <- gsub("민원", "", data3)
data3 <- gsub("이용", "", data3)
data3 <- gsub("관련", "", data3)
data3 <- gsub("시장", "", data3)
data3 <- gsub("한", "", data3)

write(unlist(data3), "seoul_3.txt")
data4 <- read.table("seoul_3.txt")
wordcount <- table(data4)
head(sort(wordcount, decreasing = T), 20)

# 워드 클라우드

library(RColorBrewer)
palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=1, random.order=F, random.color = T, colors=palete)
legend(0.3, 1, "서울시 응답소 요청사항 분석", cex=0.8, fill=NA, border=NA, bg="white", text.col="red", text.font=2, box.col="red")


# 성형외과 질문 게시판 분석

## 사전 불러오기
useSejongDic()

data1 <- read_lines("remake.txt")
data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) <= 10}, data3)

head(unlist(data3), 30)

data3 <- gsub("\\d+", "", data3)
data3 <- gsub("쌍수", "쌍꺼풀", data3)
data3 <- gsub("쌍커풀", "쌍꺼풀", data3)
data3 <- gsub("메부리코", "매부리코", data3)
data3 <- gsub("\\.", "", data3)
data3 <- gsub(" ", "", data3)
data3 <- gsub("\\'", "", data3)

data3

write(unlist(data3), "remake_2.txt")
data4 <- read.table("remake_2.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount

head(sort(wordcount, decreasing=T), 20)

data4

txt <- readLines("성형gsub.txt")
txt
cnt_txt <- length(txt)

i <- 1
for (i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), "", data3)
}

data3
data3 <- Filter(function(x) {nchar(x) >=2}, data3)
write(unlist(data3), "remake_2.txt")
data4 <- read.table("remake_2.txt")
data4
nrow(data4)

wordcount <- table(data4)
wordcount

head(sort(wordcount, decreasing=T), 30)

palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=2, random.order = F, random.color=T, colors=palete)

# 제주도 추천 여행코스 찾기

install.packages("stringr")
library(KoNLP)
library(wordcloud)
library(tidyverse)
library(stringr)

useSejongDic()
mergeUserDic(data.frame(readLines("제주도여행지.txt", encoding = "UTF-8")))

txt <- readLines("jeju.txt", encoding="UTF-8")
place <- sapply(txt, extractNoun, USE.NAMES = F)
place
head(unlist(place), 30)
cdata <- unlist(place)
place <- str_replace_all(cdata, "[^[:alpha:]]", "")
place <- gsub(" ", "", place)

txt <- readLines("제주도여행코스gsub.txt", encoding="UTF-8")
txt

cnt_txt <- length(txt)
i <- 1
for(i in 1:cnt_txt) {
  place <- gsub((txt[i]), "", place)
}


place <- Filter(function(x) {nchar(x) >= 2}, place)
write(unlist(place), "jeju_2.txt")
rev <- read.table("jeju_2.txt")
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing=T), 30)

library(RColorBrewer)
palete <- brewer.pal(9, "Set1")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=2, random.order=F, random.color=T, colors=palete)
