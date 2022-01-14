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
sudeste_etanol_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_etanol_revenda)
nordeste_etanol_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_etanol_revenda)
sul_etanol_revenda <- cbind(REGIAO = 'SUL', sul_etanol_revenda)
norte_etanol_revenda <- cbind(REGIAO = 'NORTE', norte_etanol_revenda)
centroOeste_etanol_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_etanol_revenda)


etanol_regional <- rbind(sudeste_etanol_revenda,nordeste_etanol_revenda,sul_etanol_revenda,norte_etanol_revenda,centroOeste_etanol_revenda)



ggplot(etanol_regional, aes(x = ANO , y = Média_Etanol)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço do Etanol médio por região do Brasíl",
    subtitle = "(2004-2019)",
    x = "Ano",
    y = "Preço do Etanol (R$/L)",
  )


