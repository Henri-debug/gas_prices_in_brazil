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

centroOeste <- prices%>%filter(REGIÃO == 'CENTRO OESTE')
View(centroOeste)

### Saber os niveis de produto que existem
factor(centroOeste$PRODUTO)


### Criação dos sub-grupos de produtos
centroOeste_etanol <- centroOeste%>%filter(PRODUTO=='ETANOL HIDRATADO',)
centroOeste_gasolina_comum <- centroOeste%>%filter(PRODUTO == 'GASOLINA COMUM',)
centroOeste_glp <- centroOeste%>%filter(PRODUTO == "GLP",)
centroOeste_gnv <- centroOeste%>%filter(PRODUTO == 'GNV',)
centroOeste_oleo_diesel <- centroOeste%>%filter(PRODUTO == 'ÓLEO DIESEL',)
centroOeste_oleo_diesel_s10 <- centroOeste%>%filter(PRODUTO == 'ÓLEO DIESEL S10',)

### Plotar grafico ano x preço médio revenda ETANOL
centroOeste_etanol_revenda <- group_by(centroOeste_etanol, ANO)%>%summarise(Média_Etanol = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_etanol_revenda, aes(x = ANO,y = Média_Etanol))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Etanol na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Etanol"
)

### Plotar grafico ano x preço médio revenda GASOLINA COMUM
centroOeste_gasolina_revenda <- group_by(centroOeste_gasolina_comum, ANO)%>%summarise(Média_Gasolina = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_gasolina_revenda, aes(x = ANO, y = Média_Gasolina))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda da Gasolina Comum na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio da Gasolina"
)

### Plotar grafico ano x preço médio revenda GLP
centroOeste_glp_revenda <- group_by(centroOeste_glp, ANO)%>%summarise(Média_GLP = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_glp_revenda, aes(x = ANO, y = Média_GLP))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GLP na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GLP"
)

### Plotar grafico ano x preço médio revenda GNV
centroOeste_gnv_revenda <- group_by(centroOeste_gnv, ANO)%>%summarise(Média_GNV = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_gnv_revenda, aes(x = ANO,y = Média_GNV))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GNV na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GNV"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL
centroOeste_oleo_diesel_revenda <- group_by(centroOeste_oleo_diesel, ANO)%>%summarise(Média_O_DIESEL = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_oleo_diesel_revenda, aes(x = ANO, y = Média_O_DIESEL))+geom_line()+geom_point()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL S10
centroOeste_oleo_diesel_s10_revenda <- group_by(centroOeste_oleo_diesel_s10, ANO)%>%summarise(Média_O_DIESEL_S10 = mean(`PREÇO MÉDIO REVENDA`))
ggplot(centroOeste_oleo_diesel_s10_revenda, aes(x = ANO, y = Média_O_DIESEL_S10))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel s10 na região centro oeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel S10"
)