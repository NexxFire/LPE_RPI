#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define LED_GPIO    0  // DEFAULT LED GPIO
#define BUTTON_GPIO 24  // DEFAULT BUTTON GPIO

void sigint_handler(int sig);
void cleanup();


// Light the given led when the givent button is pressed using wiringPi
int main(int argc, char *argv[]) {
    //define the signal handler
    signal(SIGINT, sigint_handler);


    int led_gpio;
    int button_gpio;
    if (argc == 2) {
        led_gpio = atoi(argv[1]);
        button_gpio = BUTTON_GPIO;
    } 
    else if (argc == 3) {
        led_gpio = atoi(argv[1]);
        button_gpio = atoi(argv[2]);
    }
    else {
        led_gpio = LED_GPIO;
        button_gpio = BUTTON_GPIO;
    }
    printf ("LED GPIO: %d\n", led_gpio);
    printf ("BUTTON GPIO: %d\n", button_gpio);
    wiringPiSetup();
    pinMode(led_gpio, OUTPUT);
    pinMode(button_gpio, INPUT);
    while (1) {
        digitalWrite(led_gpio, digitalRead(button_gpio));
    }
    return 0;
}

// turn off the led when the program exits
void cleanup() {
    digitalWrite(LED_GPIO, HIGH);
}

// turn off the led when the program is interrupted
void sigint_handler(int sig) {
    cleanup();
    exit(0);
}

