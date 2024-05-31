#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>


#define LED_GPIO    0  // DEFAULT LED GPIO
#define BUTTON_GPIO 24  // DEFAULT BUTTON GPIO

void sigint_handler(int sig);
void cleanup();

// Wink the given led when the given button is pressed using wiringPi
int main(int argc, char *argv[]) {
    // Define the signal handler
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

    int state = 1;
    int button_state = 0;
    int last_button_state = 0;
    wiringPiSetup();
    pinMode(led_gpio, OUTPUT);
    pinMode(button_gpio, INPUT);
    while (1) {
        button_state = digitalRead(button_gpio);
        if (button_state == LOW && last_button_state == HIGH) {
            state = !state;
        }
        digitalWrite(led_gpio, state || LOW);
        delay(100);
        digitalWrite(led_gpio, HIGH);
        delay(100);
        last_button_state = button_state;
        
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

