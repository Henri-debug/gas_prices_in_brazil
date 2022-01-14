## Importando bibliotecas
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
library(ggplot2)
library(dplyr)
library(readr)

#importando base de dados original
prices <- read_tsv("Data/2004-2019.tsv")

#Retirando coluna indesejada
prices$...1 <- NULL

View(prices)

#Adicionando Colunas Regionais
sudeste_oleo_diesel_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_oleo_diesel_revenda)
nordeste_oleo_diesel_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_oleo_diesel_revenda)
sul_oleo_diesel_revenda <- cbind(REGIAO = 'SUL', sul_oleo_diesel_revenda)
norte_oleo_diesel_revenda <- cbind(REGIAO = 'NORTE', norte_oleo_diesel_revenda)
centroOeste_oleo_diesel_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_oleo_diesel_revenda)


oleo_diesel_regional <- rbind(sudeste_oleo_diesel_revenda,nordeste_oleo_diesel_revenda,sul_oleo_diesel_revenda,norte_oleo_diesel_revenda,centroOeste_oleo_diesel_revenda)



ggplot(oleo_diesel_regional, aes(x = ANO , y = Média_O_DIESEL)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço da Óleo Diesel médio por região do Brasíl",
    subtitle = "(2004-2019)",
    x = "Ano",
    y = "Preço da Óleo Diesel (R$/L)",
  )

