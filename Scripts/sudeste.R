### Importando bibliotecas
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

### Plotar grafico ano x preço médio revenda ETANOL
sudeste_etanol_revenda <- group_by(sudeste_etanol, ANO)%>%summarise(Média_Etanol = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_etanol_revenda, aes(x = ANO,y = Média_Etanol))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Etanol na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Etanol"
)

### Plotar grafico ano x preço médio revenda GASOLINA COMUM
sudeste_gasolina_revenda <- group_by(sudeste_gasolina_comum, ANO)%>%summarise(Média_Gasolina = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_gasolina_revenda, aes(x = ANO, y = Média_Gasolina))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda da Gasolina Comum na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio da Gasolina"
)

### Plotar grafico ano x preço médio revenda GLP
sudeste_glp_revenda <- group_by(sudeste_glp, ANO)%>%summarise(Média_GLP = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_glp_revenda, aes(x = ANO, y = Média_GLP))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GLP na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GLP"
)

### Plotar grafico ano x preço médio revenda GNV
sudeste_gnv_revenda <- group_by(sudeste_gnv, ANO)%>%summarise(Média_GNV = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_gnv_revenda, aes(x = ANO,y = Média_GNV))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do GNV na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do GNV"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL
sudeste_oleo_diesel_revenda <- group_by(sudeste_oleo_diesel, ANO)%>%summarise(Média_O_DIESEL = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_oleo_diesel_revenda, aes(x = ANO, y = Média_O_DIESEL))+geom_line()+geom_point()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel"
)

### Plotar grafico ano x preço médio revenda ÓLEO DIESEL S10
sudeste_oleo_diesel_s10_revenda <- group_by(sudeste_oleo_diesel_s10, ANO)%>%summarise(Média_O_DIESEL_S10 = mean(`PREÇO MÉDIO REVENDA`))
ggplot(sudeste_oleo_diesel_s10_revenda, aes(x = ANO, y = Média_O_DIESEL_S10))+geom_point()+geom_line()+theme_minimal()+labs(
  title = "Preço médio de revenda do Óleo Diesel s10 na região Sudeste",
  subtitle = "(2004-2019)",
  x= "Ano",
  y= "Valor médio do Óleo Diesel S10"
)
