# Dados -------------------------------------------------------------------

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)



dados <- readr::read_csv("~/Estagio_stat/ODS13/dados_temp.csv")



# Gráfico de colunas ------------------------------------------------------

dados |> 
  ggplot(aes(x=Ano, 
             y= valor,"ºC"))+
  geom_col(position = "dodge", fill = "darkgreen")+
  xlab("Ano") +
  ylab("Graus (ºC)")+
  labs(
    title = "Variação da temperatura média global",
    subtitle = "Mes de dezembro (1960-2022)",
    caption = "@StatUFSM  |  Fonte: National Centers for Environmental information")+
  theme_minimal()



#----------------------------------------------------------------


dados2 <- readr::read_csv("~/Estagio_stat/ODS13/temp_2.csv")



# Gráfico de colunas ------------------------------------------------------

dados2 |> 
  ggplot(aes(x=Ano, 
             y= valor,"ºC"))+
  geom_col(position = "dodge", fill = "darkgreen")+
  xlab("Ano") +
  ylab("Graus (ºC)")+
  labs(
    title = "Variação da temperatura média global",
    subtitle = "Mes de Janeiro (2000-2022)",
    caption = "@StatUFSM  |  Fonte: National Centers for Environmental information")+
  theme_minimal()






