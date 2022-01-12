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

sudeste <- group_by(prices, REGIÃO = 'SUDESTE')
View(sudeste)

### Saber os niveis de produto que existem
factor(sudeste$PRODUTO)

### Criação dos sub-grupos de produtos
sudeste_etanol <- group_by(sudeste, PRODUTO = 'ETANOL HIDRATADO')
sudeste_gasolina_comum <- group_by(sudeste, PRODUTO = 'GASOLINA COMUM')
sudeste_glp <- group_by(sudeste, PRODUTO = 'GLP')
sudeste_gnv <- group_by(sudeste, PRODUTO = 'GNV')
sudeste_oleo_diesel <- group_by(sudeste, PRODUTO = 'ÓLEO DIESEL')
sudeste_oleo_diesel_s10 <- group_by(sudeste, PRODUTO = 'ÓLEO DIESEL S10')
