library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)
library(cowplot)

#### Dados ####

ind <- readxl::read_excel("~/Estagio_stat/ODS13/ind13.2.2.xlsx", 
                          col_types = c("numeric", "numeric"))

ind115 <- readxl::read_excel("~/Estagio_stat/ODS11/ind11.5.xlsx")

logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


#### grafico de linhas ####
#pesquisadores

ind |> 
  ggplot(aes(x=ano, 
             y=quant, group=1))+
  geom_line(color = "darkgreen", size=0.7)+
  #geom_point(color = "darkorange")+
  xlab("Ano") +
  ylab("Quantidade total de emissão de gases ")+
  labs(
  title = "Emissões de gases do efeito estufa diretos por ano",
  #subtitle = "(Governo federal)",
  caption = "@StatUFSM  |  Fonte: Relatório Bienal/Comunicação Nacional \n - Ministério da Ciência, Tecnologia, Inovações e Comunicações")+
  theme_minimal()


plot1 <- ggdraw() +
  #draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
  draw_plot(p) +
  theme(plot.background = element_rect(fill="white", color = NA))

plot1


