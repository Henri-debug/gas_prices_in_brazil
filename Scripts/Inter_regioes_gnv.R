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
sudeste_gnv_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_gnv_revenda)
nordeste_gnv_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_gnv_revenda)
sul_gnv_revenda <- cbind(REGIAO = 'SUL', sul_gnv_revenda)
norte_gnv_revenda <- cbind(REGIAO = 'NORTE', norte_gnv_revenda)
centroOeste_gnv_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_gnv_revenda)


gnv_regional <- rbind(sudeste_gnv_revenda,nordeste_gnv_revenda,sul_gnv_revenda,norte_gnv_revenda,centroOeste_gnv_revenda)



ggplot(gnv_regional, aes(x = ANO , y = Média_GNV)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço da GNV média por região do Brasíl",
    subtitle = "(2004-2019)",
    x = "Ano",
    y = "Preço da GNV (R$/m3)",
  )

