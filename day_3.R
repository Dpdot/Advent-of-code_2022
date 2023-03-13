library(tidyverse)
library(data.table)

dane <- read.csv('_3_.txt', header = F, sep ="\n", colClasses = "character")

split_dane <- strsplit(dane[,1], split = "")
 
tabela_danych <- data.frame(matrix(as.numeric(unlist(split_dane)), nrow=length(split_dane), byrow=TRUE))

w_gamma <- vector()
w_epsilon <- vector()

for ( i in 1:length(tabela_danych)) {
  if(sum(tabela_danych[i])/1000 < 0.5) {
    w_gamma[i] <- 0
    w_epsilon[i] <- 1
  }
  if(sum(tabela_danych[i])/1000 > 0.5) {
    w_gamma[i] <- 1
    w_epsilon[i] <- 0
  }
}


licz_gamma <- strtoi(paste(w_gamma,collapse=""), base= 2)

licz_epsilon <- strtoi(paste(w_epsilon,collapse=""), base= 2)

licz_gamma*licz_epsilon


#-----------------------------------------

tabela_2 <- as.data.table(tabela_danych)
i <- 1
while(length(tabela_2$X1) > 1) {
names(tabela_2[,i]) <- "act"
  srednia <- sum(tabela_2[i])/1000
  if(srednia < 0.5) {
    tabela_2 <- tabela_2[act==0]
  } else {
    tabela_2 <- tabela_2[act==1]
  }
  i <- i+1
}




