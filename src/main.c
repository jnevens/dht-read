#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pi_2_dht_read.h"

void print_help(char *argv[])
{
	printf("Usage: %s DHT11|DHT22 gpio\n", argv[0]);
	exit(-1);
}

int main(int argc, char *argv[])
{
	int sensor = DHT22;
	int pin = 2;
	float humidity = -1.0;
	float temperature = -99.0;

	if(argc < 3) {
		print_help(argv);
	} else {
		pin = atoi(argv[2]);
		if(strcmp(argv[1], "DHT11") == 0) {
			sensor = DHT11;
		} else if(strcmp(argv[1], "DHT22") == 0 ) {
			sensor = DHT22;
		} else {
			print_help(argv);
		}
	}

	if(pi_2_dht_read(sensor, pin, &humidity, &temperature)) {
		fprintf(stderr, "Failed reading dht!\n");
	} else {
		printf("Temperature: %f\n", temperature);
		printf("Humidity: %f\n", humidity);
	}

	return 0;
}
