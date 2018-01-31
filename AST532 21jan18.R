x<-1:100
filter(x,rep(1,3))
filter(x,rep(1,3),sides=1)
?mutate()
library(gapminder)
dat<-filter(gapminder,continent=="Canada")
head(gapminder)
head(dat)
select(gapminder,country,continent)
library(dplyr)
 

filter(gapminder,country=="Canada")
filter(gapminder,country==c("Canada","Algeria"))
filter(gapminder,country==c("Canada","Algeria") | year==1957)
View(gapminder)

gapminder %>%
  filter(country %in% c("Canada","Algeria"),year<=1969,year>=1960) %>% select(country,year,gdpPercap)


mutate(gapminder,gdp=gdpPercap*pop)

gapminder %>%
  group_by(country) %>%
  summarise(mean_pop=mean(pop),sd_pop=sd(pop))


#############23 jan exercise
library(tidyverse)
library(gapminder)
library(forcats)

levels(gapminder$continent)
nlevels(gapminder$continent)
class(gapminder$continent)

gapminder %>% count(continent)
fct_count(gapminder$continent)


nlevels(gapminder$country)
h_countries<-c("Egypt","Haiti","Romania","Thailand","Venezuela")
h_gap<-gapminder %>% filter(country %in% h_countries) 
nlevels(h_gap$country)

h_gap_dopped<-h_gap %>% droplevels()
nlevels(h_gap_dopped$country)


h_gap$country %>% fct_drop() %>% levels()

library(forcats)
library(gapminder)
gapminder$continent %>%  fct_infreq() %>% fct_rev() %>% levels()

library(dplyr)
gap_asia_2007 <-filter(gapminder,year == 2007,continent=="Asia")
gapasia <- gapminder %>% filter(year==2007, continent=="Asia")

head(gapminder$continent)
head(gapminder)

head(gapasia)
library(ggplot2)
ggplot(gapasia,aes(x=lifeExp,y=country))+geom_point()
ggplot(gapasia,aes(x=lifeExp,y=fct_reorder(country,lifeExp)))+geom_point()

h_countries<-c("Egypt","Haiti","Romania","Thailand","Venezuela")
h_gap<-gapminder %>% filter(country %in% h_countries)  %>%droplevels
ggplot(h_gap,aes(x=year,y=lifeExp,color=country))+geom_line()
ggplot(h_gap,aes(x=year,y=lifeExp,color=fct_reorder2(country,year,lifeExp)))+geom_line()


