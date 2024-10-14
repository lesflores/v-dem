#--------------------------------------------------------------------------------
# Descargar datos de V-Dem y agruparlos por continente creando una nueva variable
#--------------------------------------------------------------------------------

# Instala el paquete devtools y luego usa la función install_github() para descargar 
# el paquete vdemdata desde GitHub.
# En https://github.com/vdeminstitute/vdemdata se encuentran los datos de V-Dem.
install.packages("devtools")
devtools::install_github("vdeminstitute/vdemdata")

# Llamar los datos de V-Dem
library(vdemdata)

# Resumen de los años disponibles en los datos. El rango temporal es: 1789-2023
summary(vdem$year)

# Lista de países disponibles en los datos
lista_paises <- unique(vdem$country_name)
lista_paises

# Paquete countrycode, se utiliza para asignar el continente a cada país.
install.packages("countrycode")
library(countrycode)

# Aquí se agrega una nueva columna llamada continent al conjunto de datos, 
# donde se asigna el continente correspondiente a cada país utilizando 
# el nombre del país como referencia
vdem$continent <- countrycode(vdem$country_name, "country.name", "continent")

# Ver los países con su continente
unique(vdem[, c("country_name", "continent")])
