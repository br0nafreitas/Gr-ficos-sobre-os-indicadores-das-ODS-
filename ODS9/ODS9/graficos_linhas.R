

library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)


#### Dados ####

pesquisadores <- readxl::read_excel("pesquisadores.xlsx", 
                            col_types = c("text", "numeric"))

gas <- readxl::read_excel("co2_pib.xlsx", 
                          col_types = c("text", "numeric"))
logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


#### grafico de linhas ####
#pesquisadores

p <- pesquisadores |> 
  ggplot(aes(x=Ano, 
             y=Pesquisadores, group=1))+
  geom_line(color = "darkorange")+
  geom_point(color = "darkorange")+
  xlab("Ano") +
  ylab("Número de pesquisadores")+
  labs(
    title = "Pesquisadores  por milhão de habitantes por ano",
    subtitle = "(em equivalência de tempo integral)",
    caption = "@StatUFSM  |  Fonte: IBGE")+
  theme_minimal()

plot1 <- ggdraw() +
  draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
  draw_plot(p) +
  theme(plot.background = element_rect(fill="white", color = NA))

plot1

#co2
gas |> 
  ggplot(aes(x=Ano, 
             y=Brasil, group=1))+
  geom_line(color = "darkorange")+
  geom_point(color = "darkorange")+
  xlab("Ano") +
  ylab("Número de emissão de CO2 pelo PIB")+
  labs(
  title = "Emissões de CO2 relativas ao BEN pelo PIB",
  subtitle = "BEN: Setor Energia mais as emissões de Processos Industriais ligadas a combustíveis fósseis",
  caption = "@StatUFSM  |  Fonte: IBGE e Balanço Energético Nacional
")+
  theme_minimal()

plot <- ggdraw() +
  draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
  draw_plot(gas) +
  theme(plot.background = element_rect(fill="white", color = NA))

plot