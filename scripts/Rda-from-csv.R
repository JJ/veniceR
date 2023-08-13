#!/usr/bin/env Rscript

data.doges <- read.csv("data-raw/venice-doges.csv")
data.doges$Years <- data.doges$End - data.doges$Start
data.doges$Century <- data.doges$Century +1
save(data.doges, file="data/doges.rda")

doge.families <- data.doges %>% count(Family.doge,sort=T)
save(doge.families, file="data/doge.families.rda")

doges.marriages.df <- data.frame(data.doges$Family.doge,data.doges$Family.dogaressa)
doges.marriages.df <- doges.marriages.df[ (doges.marriages.df$data.doges.Family.doge != '' ) & (doges.marriages.df$data.doges.Family.dogaressa != ''),]
doges.mothers.df <- data.frame(data.doges$Family.doge,data.doges$Family.mother)
doges.mothers.df <- doges.mothers.df[ (doges.mothers.df$data.doges.Family.doge != '' ) & (doges.mothers.df$data.doges.Family.mother != ''),]
all.links <- data.frame(doge.or.father = c(doges.marriages.df$data.doges.Family.doge,doges.mothers.df$data.doges.Family.doge),
                        dogaressa.or.mother = c(doges.marriages.df$data.doges.Family.dogaressa,doges.mothers.df$data.doges.Family.mother))
doges.marriages.sn <- graph.data.frame(all.links,directed=F)
save(doges.marriages.sn, file="data/doges.marriages.rda")

data.doges.years <- data.doges
data.doges.years$Doge.raw <- NULL
data.doges.years$Dogaressa.raw <- NULL
data.doges.years$Dogaressa <- NULL
data.doges.years$Family.dogaressa <- NULL
data.doges.years$Family.mother <- NULL
doges.years <- distinct(data.doges.years)
save(doges.years, file="data/doges.years.rda")
