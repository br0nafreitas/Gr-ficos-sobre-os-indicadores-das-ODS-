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


dados <- readxl::read_excel("emprego.xlsx", col_types = c("text", 
                                              "numeric"))

logo <- "C:/Users/Cliente/Documents/Estagio_stat/ODS9/ODS9/logo.jpeg"


states <- read_country(year = 2019)
states$name_state <- JurisVis::ToTitleCasePT(states$name_state)
dados$uf <-  JurisVis::ToTitleCasePT(dados$uf)

states <- dplyr::left_join(states, dados, by = c("name_state" = "uf"))

title <- "Emprego na indústria em proporção do emprego total no Brasil (%)"
subtitle <- "Ano 2019"
caption <- "@StatUFSM  |  Fonte: IBGE"


states %>%
  #mutate(pobreza = pobreza/100) %>%
  ggplot() + 
  geom_sf(
    aes(fill = emprego),
    size = .15
  ) +
  scale_fill_gradientn(
    colours = RColorBrewer::brewer.pal(n = 9, name = "OrRd")
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
  ) -> mapa
mapa



plot1 <- ggdraw() +
 draw_image(logo,  x = 0.38, y = -0.44, scale = .3) +
 draw_plot(mapa) +
theme(plot.background = element_rect(fill="white", color = NA))

plot1


ggsave("pib2019_map.png", width = 5.6, height = 5.6, units = "in")
