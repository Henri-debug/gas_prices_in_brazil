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
sudeste_glp_revenda <- cbind(REGIAO = 'SUDESTE', sudeste_glp_revenda)
nordeste_glp_revenda <- cbind(REGIAO = 'NORDESTE', nordeste_glp_revenda)
sul_glp_revenda <- cbind(REGIAO = 'SUL', sul_glp_revenda)
norte_glp_revenda <- cbind(REGIAO = 'NORTE', norte_glp_revenda)
centroOeste_glp_revenda <- cbind(REGIAO = 'CENTRO OESTE', centroOeste_glp_revenda)


glp_regional <- rbind(sudeste_glp_revenda,nordeste_glp_revenda,sul_glp_revenda,norte_glp_revenda,centroOeste_glp_revenda)



ggplot(glp_regional, aes(x = ANO , y = Média_GLP)) + 
  geom_line(aes(color = REGIAO),size = 1) + 
  scale_color_manual(values = c("darkred", "steelblue","darkblue","yellow","pink"))+labs(
    title = "Comparação do preço da GLP média por região do Brasíl",
    subtitle = "(2004-2019)",
    x = "Ano",
    y = "Preço da GLP (R$/13Kg)",
  )

