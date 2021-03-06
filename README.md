# Visualize NOAA Significant Earthquakes dataset

### Travis Badge
[![Build Status](https://travis-ci.org/maianhdang/noaa.visualise.svg?branch=master)](https://travis-ci.org/maianhdang/noaa.visualise)

## Description
This is `noaa.visualise` package, working with the NOAA Significant Earthquakes dataset 
to support the process of visualising and gaining information. 

The packages includes the below groups:
  
Group                 | Functions
----------------------| ----------------------------
Cleaning the raw data | eq_clean_data(), eq_location_clean(), eq_country_filter()
Visualisation tools   | geom_timeline(), geom_timeline_lable(), stat_timeline(), theme_timeline()
Mapping tools         | eq_map(), eq_create_label()

## Installation

You can install noaa.visualise from github with:

```{r gh-installation, eval = FALSE}
# install.packages("devtools")
devtools::install_github("maianhdang/noaa.visualise")
```
## Included dataset


The [NOAA Significant Earhquake Dataset](https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1) contains the information of 5,933 earthquakes over the period of 4,000 years.

**Cite:** National Geophysical Data Center / World Data Service (NGDC/WDS): Significant Earthquake Database. National Geophysical Data Center, NOAA. doi:10.7289/V5TD9V7K

## Further information about usage
The vignettes is included in the package. Call the vignettes by:
  `vignette('introduction', package = 'noaa.visualise')`

## Examples

### Visualize earthquakes by timeline

```{r visual_1}
data("raw_data")
data <- noaa.visualise::eq_clean_data(raw_data)
data <- noaa.visualise::eq_location_clean(data) ## to create the text annotation
input_data <- noaa.visualise::eq_country_filter(data, countries = c("MEXICO", "IRAN"),
                                            xmin = as.Date("1000-01-01"),
                                            xmax = as.Date("2010-01-01"))

ggplot2::ggplot(input_data, ggplot2::aes (x = date, y = COUNTRY, color = as.numeric(DEATHS), 
size = as.numeric(EQ_PRIMARY))) +

## geom_timeline  
noaa.visualise::geom_timeline(ggplot2::aes(xmin = as.Date("1900-01-01"), 
xmax =  as.Date("1925-01-01"))) +
ggplot2::labs(size = "Richter Scale Values", color = "Number of Deaths" )+

## geom_timeline_label  
noaa.visualise::geom_timeline_label(ggplot2::aes(label = LOCATION_NAME, 
                          xmin = as.Date("1900-01-01"), xmax = as.Date("1925-01-01")), 
                          n_max = 5) + 
  
noaa.visualise::theme_timeline()
```
![alt tag](https://github.com/maianhdang/noaa.visualise/blob/master/timeline-example.png)

### Visualize earthquakes in the map
```{r map_1}
library(magrittr)
data("raw_data")
data <- noaa.visualise::eq_clean_data(raw_data)
input_data <- dplyr::filter(data, COUNTRY == "MEXICO" &
                                          lubridate::year(date) >= 2000)%>%
  dplyr::mutate(popup_text = noaa.visualise::eq_create_label(.)) ## create popup_text

noaa.visualise::eq_map(input_data, annot_col = "popup_text") ## annot_col set as popup_text
          
```
![alt tag](https://github.com/maianhdang/noaa.visualise/blob/master/leaflet-example.png)
