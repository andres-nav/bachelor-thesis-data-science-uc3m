PARENT_MAKEFILE := ./templates/Makefile

OUTPUT_PDF := Final_Thesis_Andres_Navarro_Pedregal_Data_Science.pdf
VERSION := v0.1.0

export OUTPUT_PDF
export VERSION

all:
	$(MAKE) -f $(PARENT_MAKEFILE) all

%:
	$(MAKE) -f $(PARENT_MAKEFILE) $@
