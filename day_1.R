dane <- read.csv('_1_.txt', header = F, sep ="\n")
licznik <- 0

for( i in 2:length(dane[,1])) {
  if(dane[i,] > dane[i-1,]){
    licznik = licznik + 1
  }
}

#---------------------------------------------

nowe_dane <- vector()

for( i in 1:length(dane[,1])-2) {
nowe_dane[i] = dane[i,]+dane[i+1,]+dane[i+2,]
}

licznik_2 <- 0

for( i in 2:length(nowe_dane)) {
  if(nowe_dane[i] > nowe_dane[i-1]){
    licznik_2 = licznik_2 + 1
  }
}

#--------------------------------------------

