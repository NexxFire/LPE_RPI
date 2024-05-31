PATH_CC?=/usr/bin
CCC?=$(PATH_CC)/gcc



PREFIX?=/usr/local

all: ncurses
ncurses: hello_ncurses


# besoin de localiser les fichiers d'entete
# => option -I  
# besoin de localiser les librairies non standards 
# => option -L

hello_ncurses : hello-ncurses.c
	$(CCC) -L../../rootRPI/lib -I../../rootRPI/include  -I../../rootRPI/include/ncurses $^ -o $@ -lncurses
	
menu_ncurses : menu.c
	$(CCC) -L../../rootRPI/lib -I../../rootRPI/include  -I../../rootRPI/include/ncurses $^ -o $@ -lncurses
	
install: hello_ncurses
	cp hello_ncurses $(PREFIX)/bin
#   cp menu_ncurses $(PREFIX)/bin

clean: 
	rm hello_ncurses
