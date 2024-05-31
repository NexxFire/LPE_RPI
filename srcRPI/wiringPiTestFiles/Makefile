PATH_CC?=/usr/bin
CCC?=$(PATH_CC)/gcc

PREFIX?=/usr/local

all: wiringPi
wiringPi: wiringPi_test_led_up wiringPi_test_led_wink wiringPi_test_led_button wiringPi_test_led_toggle

# besoin de localiser les fichiers d'entete
# => option -I  
# besoin de localiser les librairies non standards 
# => option -L

wiringPi_test_led_up : wiringPi_test_led_up.c
	$(CCC) -L$(PREFIX)/lib -I$(PREFIX)/include $^ -o $@ -lwiringPi

wiringPi_test_led_wink : wiringPi_test_led_wink.c
	$(CCC) -L$(PREFIX)/lib -I$(PREFIX)/include $^ -o $@ -lwiringPi

wiringPi_test_led_button : wiringPi_test_led_button.c
	$(CCC) -L$(PREFIX)/lib -I$(PREFIX)/include $^ -o $@ -lwiringPi

wiringPi_test_led_toggle : wiringPi_test_led_toggle.c
	$(CCC) -L$(PREFIX)/lib -I$(PREFIX)/include $^ -o $@ -lwiringPi


install: wiringPi
	cp wiringPi_test_led_button $(PREFIX)/bin
	cp wiringPi_test_led_toggle $(PREFIX)/bin
	cp wiringPi_test_led_wink $(PREFIX)/bin
	cp wiringPi_test_led_up $(PREFIX)/bin
#   cp menu_ncurses $(PREFIX)/bin

clean: 
	rm wiringPi_test_led_wink wiringPi_test_led_button wiringPi_test_led_toggle
