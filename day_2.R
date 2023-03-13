library(tidyverse)
dane <- read.csv('_2_.txt', header = F, sep ="\n")
split_dane <- strsplit(dane[,1], split = " ")

df <- data.frame(matrix(unlist(split_dane), nrow=length(split_dane), byrow=TRUE))

df$X2 <- as.numeric(df$X2)

pozycja <- df %>% group_by(X1) %>% summarise(sum(X2))

wysokosc <- as.numeric(pozycja %>% filter(X1=="down") %>% select(`sum(X2)`) - pozycja %>% filter(X1=="up") %>% select(`sum(X2)`))

odleglosc <- as.numeric(pozycja %>% filter(X1=="forward") %>% select(`sum(X2)`))


wysokosc*odleglosc




#-----------------------------------------------
odleglosc_2 <- 0
wysokosc_2 <- 0
aim <- 0

for( i in 1:length(df[,1])) {
  
  if(df[i,1]=='forward') {
    odleglosc_2 <- odleglosc_2 + df[i,2]
    wysokosc_2 <- wysokosc_2 + aim*df[i,2]
  } else {
    if(df[i,1]=='down') {
      aim = aim + df[i,2] 
    } else {
      aim = aim - df[i,2]
    }
  }
  
}

wysokosc_2*odleglosc_2