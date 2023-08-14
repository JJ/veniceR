MARRIAGES_DATA=data/marriages.data.rda data/patrician.marriages.rda data/marriages.graph.rda
all: $(MARRIAGES_DATA)

$(MARRIAGES_DATA): data-raw/venice_marriages_puga_treffler_families.csv
	scripts/Rda-from-csv.R

