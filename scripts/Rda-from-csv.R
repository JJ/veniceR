#!/usr/bin/env Rscript

library(igraph)
marriages.data <- read.csv("data-raw/venice_marriages_puga_treffler_families.csv")
save(marriages.data, file="data/marriages.data.rda")

patrician.marriages <- marriages.data[ marriages.data$wife_familyname_std != '',]
save(patrician.marriages, file="data/patrician.marriages.rda")

marriage.graph <- graph.data.frame(patrician.marriages,directed = F)
save(marriage.graph,file="data/marriages.graph.rda")
