PARENT_MAKEFILE := ./templates/Makefile

OUTPUT_PDF := Final_Thesis_Bachelor_Data_Science_Andres_Navarro_Pedregal.pdf
VERSION := v1.0.1

export OUTPUT_PDF
export VERSION

all:
	$(MAKE) -f $(PARENT_MAKEFILE) all

%:
	$(MAKE) -f $(PARENT_MAKEFILE) $@
