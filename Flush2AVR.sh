#!/bin/sh

TMP_PATH=$1
APP_NAME="rfa"
AVRDUDE="$(which avrdude)"
MMCU="atmega128rfa1"
PROGRAMMER="USBasp"

$AVRDUDE -c $PROGRAMMER -P usb -p $MMCU -U flash:w:$TMP_PATH$APP_NAME".hex":i
