library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)
library(cowplot)

#### Dados ####

ind <- readxl::read_excel("~/Estagio_stat/ODS11/ind11.4.xlsx", 
                          col_types = c("text", "numeric"))

ind115 <- readxl::read_excel("~/Estagio_stat/ODS11/ind11.5.xlsx")

logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


#### grafico de linhas ####
#pesquisadores

p <- ind |> 
  ggplot(aes(x=Ano, 
             y=valor, group=1))+
  geom_line(color = "darkorange")+
  geom_point(color = "darkorange")+
  xlab("Ano") +
  ylab("Despesa (per capita em reais)")+
  #labs(
    #title = "Despesa pública per capita gasta na preservação, proteção e conservação do patrimônio (Reais)",
    #subtitle = "(Governo federal)",
    #caption = "@StatUFSM  |  Fonte: SIAFI e SICONFI - STN e IBGE")+
  theme_minimal()


plot1 <- ggdraw() +
  #draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
  draw_plot(p) +
  theme(plot.background = element_rect(fill="white", color = NA))

plot1


#indicador 11.5
attach(ind115)
ind115 |>
  ggplot(aes(x= Ano, y= Sul))+
  geom_line(aes(col = "Sul"), size = 1)+
  geom_line(aes(y=Norte,col = "Norte"), size = 1)+
  geom_line(aes(y=Nordeste, col = "Nordeste"), size = 1)+
  geom_line(aes(y=Sudeste, col = "Sudeste"), size = 1)+
  geom_line(aes(y= `Centro-oeste`, col = "Centro-oeste"), size = 1)+
  scale_y_continuous(breaks = c(0,1000,2000,3000)) +  
  #geom_point(color = "darkorange")+
  xlab("Ano") +
  ylab("Número de pessoas (Por 100 mil habitantes)") + 
  labs(
    #title = "Número de mortes, pessoas desaparecidas e pessoas diretamente afetadas atribuído a desastres",
    #subtitle = "Por 100 mil habitantes (Pessoas)",
    #caption = "@StatUFSM  |  Fonte: MI, SEDEC, SID, IBGE, DPE E COPIS",
    colour = "Regiões"
)+
  scale_fill_brewer(palette = "Dark2")+
  theme_minimal()



plot <- ggdraw() +
  draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
  draw_plot(gas) +
  theme(plot.background = element_rect(fill="white", color = NA))

plot
