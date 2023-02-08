
# Dados -------------------------------------------------------------------

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)

dados <- readxl::read_xlsx("renda_per.xlsx",
                            sheet = "Página1")



# Gráfico de colunas ------------------------------------------------------

barra <- dados |> 
  ggplot(aes(x=Ano, 
             y=`Taxa de crescimento real do PIB per capita (%)`))+
  geom_col(position = "dodge", fill = "#66CC99")+
  xlab("Ano") +
  ylab("Taxa de crescimento real do PIB")+
  labs(
    title = "Taxa de crescente real do PIB per capita por ano",
    caption = "@StatUFSM  |  Fonte: IBGE")+
  theme_minimal()


# Gráfico de linhas -------------------------------------------------------

#Verificar pq a linha não plota
dados |> 
  ggplot(aes(x=Ano, 
             y=`Taxa de crescimento real do PIB per capita (%)`))+
  geom_line()+
  geom_point()+
  xlab("Ano") +
  ylab("Taxa de crescimento real do PIB")+
  labs(
    title = "Taxa de crescente real do PIB per capita por ano",
    caption = "@StatUFSM  |  Fonte: IBGE")+
  theme_minimal()



# Gráfico renda média por sexo  -------------------------------------------

dados2 <- readxl::read_xlsx("dados_sexo_rend.xlsx",
                            sheet = "Página1")

g1<- dados2 |> 
  # Converte o ano para factor - será categoria no gráfico
  #mutate(Ano = as.character(Ano)) |> 
  group_by(Regiões, Sexo) |> 
    ggplot(aes(y = Regiões, x = `Salário médio por hora de empregados de 15 anos ou mais de idade (Reais)`, fill = Sexo)) +
  scale_fill_manual(
    values = c("#275a8d",
               "#ac0a47"))+
  geom_col(position = "dodge")+
  xlab("Salário médio por hora de empregados de 15 anos ou mais de idade (Reais)") +
  ylab("UF")+
  labs(
    title = "Horas diárias dedicadas ao afazeres domesticos",
    caption = "@StatUFSM  |  Fonte: IBGE")+
  theme_minimal()


# Gráfico deficiência  ----------------------------------------------------

dados3 <- readxl::read_xlsx("defic.xlsx",
                            sheet = "Página1")

g2<- dados3 |> 
  # Converte o ano para factor - será categoria no gráfico
  #mutate(Ano = as.character(Ano)) |> 
  group_by(Regiões, Deficiência) |> 
  ggplot(aes(y = Regiões, x = `Salário médio por hora de empregados de 15 anos ou mais de idade, por existência de deficiência`, fill = Deficiência)) +
  scale_fill_manual(
    values = c("#66CC66",
               "#66CCFF"))+
  geom_col(position = "dodge")+
  xlab("Salário médio por hora") +
  ylab("Regiões")+
  labs(
    title = "Salário médio por hora de empregados de 15 anos ou mais de idade, por existência de deficiência",
    caption = "@StatUFSM  |  Fonte: IBGE")+
  theme_minimal()
g2
