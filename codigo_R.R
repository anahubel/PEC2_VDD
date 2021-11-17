#### CARTOGRAMA ####
# Use the cartogram and rgeos packages
library(cartogram)
library(rgeos)
library(stars)

# Get the shape file of Africa
library(maptools)
data(wrld_simpl)
afr=wrld_simpl[wrld_simpl$REGION==2,]

# We can visualize the region's boundaries with the plot function
plot(afr)

# We work with the cartogram library 
library(cartogram)

library(maptools)
library(sf)
library(ggplot2)

countries = c('Austria', 'Belgium', 'Bulgaria', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Slovenia', 'Spain', 'Sweden', 'United Kingdom')

data(wrld_simpl)

mapsimple = wrld_simpl[wrld_simpl$NAME %in% countries,]

sfno <- st_as_sf(mapsimple)
st_crs(sfno)

sfproj <- st_transform(sfno, crs = 23038)
st_crs(sfproj)

cartogram <- cartogram_cont(sfproj, "POP2005", itermax = 7)

ggplot() +
  geom_sf(data = cartogram, aes(fill = POP2005))  +
  labs(fill ="Population 2005")+
  theme_void()


#### GRÁFICA DE VELA ####

library(quantmod)
library(xts)
library(zoo)
getSymbols("GOOG",src="yahoo",from='2021-11-01',to='2021-11-16')
GOOG<-to.weekly(GOOG)
chartSeries(GOOG,theme='white',name="Gráfica semanal de los datos de Google",up.col='red',dn.col='green', TA = NULL)

# Gráfica semanal
GOOGW<-to.weekly(GOOG)
chartSeries(GOOGW,theme='white',name="Gráfica semanal de los datos de Google",up.col='red',dn.col='green', TA = NULL)

#### GRÁFICA DE MOSAICO O DIAGRAMA DE MARIMEKKO ####

# Cargamos los datos
download.file(
  url = "https://raw.githubusercontent.com/jboscomendoza/r-principiantes-bookdown/master/datos/bank.csv", 
  destfile = "bank.csv"
)

readLines("bank.csv", n = 4) 

banco <- read.csv(file = "bank.csv", sep = ";")

plot(x = banco$marital, y = banco$education)

plot(x = banco$marital, y = banco$education, 
     col = c("#99cc99", "#cc9999", "#9999cc", "#9c9c9c"))

mosaicplot(~factor(marital, labels = c("Divorciado", "Casado", "Soltero")) + factor(education, labels = c("Primaria", "Secundaria", "Terciaria", "Desconocida")), # introducimos las variables que queremos cruzar
           data = banco, 
           color = c("#99cc99", "#cc9999", "#9999cc", "#9c9c9c"), # vector de colores, si se pone color = T, queda en banco y negro. 
           las = 1,
           main = "Relación entre nivel de educación y situación marital",
           xlab = "Situación marital",
           ylab = "Nivel de educación") # estilo de los ejes
