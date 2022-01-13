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

nordeste <- prices%>%filter(REGIÃO == 'NORDESTE')
View(nordeste)

### Saber os niveis de produto que existem
factor(nordeste$PRODUTO)


### Criação dos sub-grupos de produtos
nordeste_etanol <- nordeste%>%filter(PRODUTO=='ETANOL HIDRATADO',)
nordeste_gasolina_comum <- nordeste%>%filter(PRODUTO == 'GASOLINA COMUM',)
nordeste_glp <- nordeste%>%filter(PRODUTO == "GLP",)
nordeste_gnv <- nordeste%>%filter(PRODUTO == 'GNV',)
nordeste_oleo_diesel <- nordeste%>%filter(PRODUTO == 'ÓLEO DIESEL',)
nordeste_oleo_diesel_s10 <- nordeste%>%filter(PRODUTO == 'ÓLEO DIESEL S10',)

### Plotar grafico ano x preço médio revenda ETANOL
nordeste_etanol_revenda <- group_by(nordeste_etanol, ANO)%>%summarise(Média_Etanol = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_etanol_revenda, aes(x = ANO,y = Média_Etanol))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Etanol na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Etanol"
)

### Plotar grafico ano x preço médio revenda GASOLINA COMUM
nordeste_gasolina_revenda <- group_by(nordeste_gasolina_comum, ANO)%>%summarise(Média_Gasolina = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_gasolina_revenda, aes(x = ANO, y = Média_Gasolina))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda da Gasolina Comum na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio da Gasolina"
)

### Plotar grafico ano x preço médio revenda GLP
nordeste_glp_revenda <- group_by(nordeste_glp, ANO)%>%summarise(Média_GLP = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_glp_revenda, aes(x = ANO, y = Média_GLP))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GLP na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GLP"
)

### Plotar grafico ano x preço médio revenda GNV
nordeste_gnv_revenda <- group_by(nordeste_gnv, ANO)%>%summarise(Média_GNV = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_gnv_revenda, aes(x = ANO,y = Média_GNV))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GNV na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GNV"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL
nordeste_oleo_diesel_revenda <- group_by(nordeste_oleo_diesel, ANO)%>%summarise(Média_O_DIESEL = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_oleo_diesel_revenda, aes(x = ANO, y = Média_O_DIESEL))+geom_line()+geom_point()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL S10
nordeste_oleo_diesel_s10_revenda <- group_by(nordeste_oleo_diesel_s10, ANO)%>%summarise(Média_O_DIESEL_S10 = mean(`PREÇO MÉDIO REVENDA`))
ggplot(nordeste_oleo_diesel_s10_revenda, aes(x = ANO, y = Média_O_DIESEL_S10))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel s10 na região nordeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel S10"
)