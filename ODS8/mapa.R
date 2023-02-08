# Dados -------------------------------------------------------------------

devtools::install_github("jjesusfilho/JurisVis")


library(dplyr)
library(ggplot2)
library(geobr)
library(sf)
library(ggtext)
library(JurisVis)
library(ggpubr)



dados1 <- readxl::read_xlsx("salario_med.xlsx",
                           sheet = "Página1")

dados1$Regiões<-gsub("Centro-Oeste", "Centro Oeste", dados1$Regiões)
states <- read_region(year = 2020)
states$name_state <- JurisVis::ToTitleCasePT(states$name_region)
dados1$Regiões<-  JurisVis::ToTitleCasePT(dados1$Regiões)
states <- left_join(states, dados1, by = c("name_region" = "Regiões"))

d2020<- states

pp<- d2020 %>%
  mutate(SA = `Salário médio por hora de empregados de 15 anos ou mais de idade (Reais)`) %>%
  ggplot() + 
  geom_sf(
    aes(fill = SA),
    size = .20
  ) +
  scale_fill_gradientn(
    colours = rev(RColorBrewer::brewer.pal(n = 5, name = "Greens")[-8])
  ) +
  labs(
    title = "<span style = 'color:gray60'> Salário médio por hora de empregados de 15 anos ou mais de idade (Reais) </span>",
    subtitle = "Ano: 2020",
    caption = "@StatUFSM  |  Fonte: IBGE, PNAD e COREN"
  ) +
  geom_sf_label(aes(label = paste0("R$",SA))) +
  theme(
    legend.direction = "horizontal",
    legend.key.height = unit(5, units = "mm"),
    legend.key.width = unit(20, units = "mm"),
    legend.title = element_blank(),
    panel.background = element_blank(),
    legend.position =  c(.45, -.02),
    plot.title = element_markdown(hjust=0.50, size = 20),
    plot.subtitle = element_markdown(hjust=0.50, size = 15, color = "grey31"),
    plot.caption = element_text(hjust = 0.5, margin = margin(20,0,0,0),
                                color = "grey30", size = 10),
    legend.text = element_text(size=9, color="grey30"),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    plot.background = element_rect(fill = 'white', colour = NA)
  ) 

pp
