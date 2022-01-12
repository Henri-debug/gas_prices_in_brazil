## Importando bibliotecas
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
library(ggplot2)
library(dplyr)
library(readr)

### Base de Dados principal
prices <- read_tsv("./Data/2004-2019.tsv")
View(prices)


### Removendo Coluna Indesejada (...1)
prices$...1 <- NULL

norte <- prices%>%filter(REGIÃO == 'NORTE')
View(norte)

### Saber os niveis de produto que existem
factor(norte$PRODUTO)


