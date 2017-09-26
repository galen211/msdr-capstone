[![Travis-CI Build Status](https://travis-ci.org/galen211/msdr-capstone.svg?branch=master)](https://travis-ci.org/<USERNAME>/<REPO>)

### Mastering Software Development in R Capstone Project
The `earthquake` package is a data-wrangling and mapping application that uses earthquake data from the [NOAA](https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1) significant earthquakes dataset.  Using the package, the user can query significant earthquakes and map their results as shown in the `sample_queries.Rmd` file.  A couple examples are given below:

### Mapping
```r
df %>%
  filter(COUNTRY == "CHINA" & lubridate::year(DATE) >= 1990) %>%
  mutate(popup_text = eq_create_label(.)) %>%
  eq_map(annot_col = "popup_text")
```
![china_earthquakes.png](vignettes/china_earthquakes.png)

### Timelines
```r
rf<- df %>% dplyr::filter(COUNTRY == "USA" | COUNTRY == "CHINA")
ggplot(rf) +
  geom_timeline(aes(x = DATE, colour = TOTAL_DEATHS, size = EQ_PRIMARY),
                alpha = 0.5, xmindate = 2000, xmaxdate = 2017) +
  theme_classic() +
  theme(legend.position = "bottom",
        axis.title.y = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major.y = element_line(colour = "grey", size = 0.5)) +
  labs(size = "Richter scale value ", colour = "# deaths ")
```
![earthquake_timeline.png](vignettes/earthquake_timeline.png)
