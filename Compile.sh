#!/bin/bash

TMP_PATH=$1
echo "Working dir $TMP_PATH"

if [ -f $TMP_PATH/*.elf ]; then
	rm $TMP_PATH/*.elf
	echo "Deleted old *elf files"
fi
if [ -f $TMP_PATH/*.hex ]; then
	rm $TMP_PATH/*.hex
	echo "Deleted old *hex files"
fi

APP_NAME="rfa"
AVRGCC="$(which avr-gcc)"
AVROBJCOPY="$(which avr-objcopy)"
MMCU="atmega128rfa1"
FLAGS="-O2 -Wall -std=gnu11 -mmcu=$MMCU"

SOURCES=$TMP_PATH$2
#SOURCES="./main.c"
#SOURCES+=" ./LED_display.c"

echo $AVRGCC $FLAGS $SOURCES -o $TMP_PATH$APP_NAME".elf"
$AVRGCC $FLAGS $SOURCES -o $TMP_PATH$APP_NAME".elf"
$AVROBJCOPY -j .text -j .data -O ihex $TMP_PATH$APP_NAME".elf" $TMP_PATH$APP_NAME".hex"
