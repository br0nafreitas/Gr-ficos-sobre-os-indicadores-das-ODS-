
devtools::install_github("jjesusfilho/JurisVis")



library(tidyverse)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(NatParksPalettes)
library(JurisVis)
library(cowplot)
library(stringi)
library(ggpubr)
library(patchwork)

dados <- readxl::read_excel("~/Estagio_stat/ODS11/ind11.xlsx")

logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


states <- read_country(year = 2019)
states$name_state <- JurisVis::ToTitleCasePT(states$name_state)
dados$uf <-  JurisVis::ToTitleCasePT(dados$uf)

states <- dplyr::left_join(states, dados, by = c("name_state" = "uf"))

title <- "Proporção de população urbana vivendo em assentamentos precários, \n assentamentos informais ou domicílios inadequados (%)"
subtitle <- "Ano 2010"
caption <- "@StatUFSM  |  Fonte: IBGE"


states %>%
  #mutate(pobreza = pobreza/100) %>%
  ggplot() + 
  geom_sf(
    aes(fill = Ano ),
    size = .15
  ) +
  scale_fill_gradientn(
    colours = RColorBrewer::brewer.pal(n = 9, name = "Greens")
  ) +
  labs(
    title = title,
    subtitle = subtitle,
    caption = caption
  ) +
  theme_cowplot(font_family = "") +
  theme(
    panel.background = element_blank(),
    plot.margin = margin(0.5, 0.15, 0.15, 0.1, "in"),
    legend.direction = "horizontal",
    legend.key.height = unit(1.5, units = "mm"),
    legend.key.width = unit(12, units = "mm"),
    legend.title = element_blank(),
    legend.position =  c(0.10, -.03),
    legend.text = element_text(size=11, color="grey30"),
    plot.title = element_text(hjust=0.55, size = 15, color = "grey35",
                              margin=margin(0, 0, 8, 0)),
    plot.subtitle = element_text(hjust=0.5, size = 13, lineheight = 0.8, color = "grey65"),
    plot.caption = element_text(hjust = 0.5, margin = margin(30, 0, 0, 0),
                                color = "grey30", size = 10),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line = element_blank(),
    axis.ticks.y = element_blank(),
  ) -> mapa1
mapa1

#---------------------------------------MAPA ind11b 


dados2 <- readxl::read_excel("ind11b.xlsx")

logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


states2 <- read_country(year = 2019)
states2$name_state <- JurisVis::ToTitleCasePT(states2$name_state)
dados2$uf <-  JurisVis::ToTitleCasePT(dados2$UF)

states2 <- dplyr::left_join(states2, dados2, by = c("name_state" = "UF"))

subtitle2 <- " Ano 2013"



states2 %>%
  #mutate(pobreza = pobreza/100) %>%
  ggplot() + 
  geom_sf(
    aes(fill = ano13),
    size = .15
  ) +
  scale_fill_gradientn(
    colours = RColorBrewer::brewer.pal(n = 9, name = "Greens")
  ) +
  labs(
    #title = title,
    subtitle2 = subtitle2,
    #caption = caption
  ) +
  theme_cowplot(font_family = "") +
  theme(
    panel.background = element_blank(),
    plot.margin = margin(0.5, 0.15, 0.15, 0.1, "in"),
    legend.direction = "horizontal",
    legend.key.height = unit(1.5, units = "mm"),
    legend.key.width = unit(12, units = "mm"),
    legend.title = element_blank(),
    legend.position =  c(0.10, -.03),
    legend.text = element_text(size=11, color="grey30"),
    plot.title = element_text(hjust=0.55, size = 15, color = "grey35",
                              margin=margin(0, 0, 8, 0)),
    plot.subtitle = element_text(hjust=0.5, size = 13, lineheight = 0.8, color = "grey65"),
    plot.caption = element_text(hjust = 0.5, margin = margin(30, 0, 0, 0),
                                color = "grey30", size = 10),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line = element_blank(),
    axis.ticks.y = element_blank(),
  ) -> mapa2


subtitle3 <- "Ano 2017"
states2 %>%
  #mutate(pobreza = pobreza/100) %>%
  ggplot() + 
  geom_sf(
    aes(fill = ano17),
    size = .15
  ) +
  scale_fill_gradientn(
    colours = RColorBrewer::brewer.pal(n = 9, name = "Greens")
  ) +
  labs(
    #title = title,
    subtitle3 = subtitle3,
    #caption = caption
  ) +
  theme_cowplot(font_family = "") +
  theme(
    panel.background = element_blank(),
    plot.margin = margin(0.5, 0.15, 0.15, 0.1, "in"),
    legend.direction = "horizontal",
    legend.key.height = unit(1.5, units = "mm"),
    legend.key.width = unit(12, units = "mm"),
    legend.title = element_blank(),
    legend.position =  c(0.10, -.03),
    legend.text = element_text(size=11, color="grey30"),
    plot.title = element_text(hjust=0.55, size = 15, color = "grey35",
                              margin=margin(0, 0, 8, 0)),
    plot.subtitle = element_text(hjust=0.5, size = 13, lineheight = 0.8, color = "grey65"),
    plot.caption = element_text(hjust = 0.5, margin = margin(30, 0, 0, 0),
                                color = "grey30", size = 10),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.line = element_blank(),
    axis.ticks.y = element_blank(),
  ) -> mapa3

final <-  mapa2 + mapa3 + 
  plot_annotation(title = "Proporção de governos locais que adotam e implementam estratégias locais de redução \n de risco de desastres em linha com as estratégias nacionais de redução de risco de desastres (%)",
                  #subtitle = "Indústria de média e alta intensidade tecnológica",
                  caption = "@StatUFSM  |  Fonte: IBGE"
  ) &  theme(plot.title = element_text(hjust=0.55, size = 15, color = "grey35",
                                       margin=margin(0, 0, 8, 0)),
             plot.subtitle = element_text(hjust=0.5, size = 13, lineheight = 0.8, color = "grey65"),
             plot.caption = element_text(hjust = 0.5, margin = margin(30, 0, 0, 0),
                                         color = "grey30", size = 10))
final
