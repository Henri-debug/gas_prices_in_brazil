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

sudeste <- prices%>%filter(REGIÃO == 'SUDESTE')
View(sudeste)

### Saber os niveis de produto que existem
factor(sudeste$PRODUTO)

### Criação dos sub-grupos de produtos



sudeste_etanol <- sudeste%>%filter(PRODUTO=='ETANOL HIDRATADO',)
sudeste_gasolina_comum <- sudeste%>%filter(PRODUTO == 'GASOLINA COMUM',)
sudeste_glp <- sudeste%>%filter(PRODUTO == "GLP",)
sudeste_gnv <- sudeste%>%filter(PRODUTO == 'GNV',)
sudeste_oleo_diesel <- sudeste%>%filter(PRODUTO == 'ÓLEO DIESEL',)
sudeste_oleo_diesel_s10 <- sudeste%>%filter(PRODUTO == 'ÓLEO DIESEL S10',)

