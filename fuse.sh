#/bin/sh

avrdude -c usbasp -P usb -p m128rfa1 -U lfuse:w:0xbf:m
avrdude -c usbasp -P usb -p m128rfa1 -U hfuse:w:0x55:m
