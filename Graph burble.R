install.packages('plotly')
library(plotly)

library(readxl)
Graph_bubble <- read_excel("~/Solicitudes/02_09_2024_mapa_migrantes_atendidos/Graph bubble.xlsx")

#############################

colors <- c('#77BD73','#E52521', '#FCC772' )

fig <- plot_ly(Graph_bubble, x = ~Inseguridad_alimentaria, y = ~poblacion_atendida, type = 'scatter', mode = 'markers', size = ~poblacion_atendida, color = ~color, colors = colors,
               sizes = c(10, 50),
               marker = list(opacity = 0.5, sizemode = 'diameter'),
               hoverinfo = 'text',
               text = ~paste('Departamento:', Departamento, '<br>Población atendida:', poblacion_atendida, '<br>Inseguridad alimentaria:', Inseguridad_alimentaria,
                             '<br>Población colombiana:', poblacion_colombiana))
fig <- fig %>% layout(title = 'Población en inseguridad alimentaria vs  Población atendida PMA',
                      xaxis = list(title= '% Inseguridad alimentaria'),
                      yaxis = list(title= '% Población atendida'),
                      showlegend = TRUE)

fig
