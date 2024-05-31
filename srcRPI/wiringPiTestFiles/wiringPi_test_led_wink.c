#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define LED_GPIO    0  // DEFAULT LED GPIO

void sigint_handler(int sig);
void cleanup();


// Light the given led when the program is running using wiringPi
int main(int argc, char *argv[]) {
    //define the signal handler
    signal(SIGINT, sigint_handler);

    int led_gpio;
    if (argc == 2) {
        led_gpio = atoi(argv[1]);
    } 
    else {
        led_gpio = LED_GPIO;
    }
    printf("LED GPIO: %d\n", led_gpio);
    wiringPiSetup();
    pinMode(led_gpio, OUTPUT);
    while (1) {
        digitalWrite(led_gpio, LOW);
        delay(100);
        digitalWrite(led_gpio, HIGH);
        delay(100);
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


