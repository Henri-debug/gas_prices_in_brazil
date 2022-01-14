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
sudeste_gasolina_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_gasolina_revenda)
nordeste_gasolina_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_gasolina_revenda)
sul_gasolina_revenda <- cbind(REGIAO = 'SUL', sul_gasolina_revenda)
norte_gasolina_revenda <- cbind(REGIAO = 'NORTE', norte_gasolina_revenda)
centroOeste_gasolina_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_gasolina_revenda)


gasolina_regional <- rbind(sudeste_gasolina_revenda,nordeste_gasolina_revenda,sul_gasolina_revenda,norte_gasolina_revenda,centroOeste_gasolina_revenda)



ggplot(gasolina_regional, aes(x = ANO , y = Média_Gasolina)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço da gasolina médio por região do Brasíl",
    subtitle = "(2004-2019)",
    x = "Ano",
    y = "Preço da Gasolina (R$/L)",
  )

