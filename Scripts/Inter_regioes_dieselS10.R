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
sudeste_oleo_diesel_s10_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_oleo_diesel_s10_revenda)
nordeste_oleo_diesel_s10_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_oleo_diesel_s10_revenda)
sul_oleo_diesel_s10_revenda <- cbind(REGIAO = 'SUL', sul_oleo_diesel_s10_revenda)
norte_oleo_diesel_s10_revenda <- cbind(REGIAO = 'NORTE', norte_oleo_diesel_s10_revenda)
centroOeste_oleo_diesel_s10_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_oleo_diesel_s10_revenda)


oleo_diesel_s10_regional <- rbind(sudeste_oleo_diesel_s10_revenda,nordeste_oleo_diesel_s10_revenda,sul_oleo_diesel_s10_revenda,norte_oleo_diesel_s10_revenda,centroOeste_oleo_diesel_s10_revenda)



ggplot(oleo_diesel_s10_regional, aes(x = ANO , y = Média_O_DIESEL_S10)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço do Óleo Diesel S10 média por região do Brasíl",
    subtitle = "(2012-2019)",
    x = "Ano",
    y = "Preço do Óleo Diesel S10 (R$/L)",
  )

