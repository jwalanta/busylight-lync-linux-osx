#!/bin/bash

USB_ADDR='7-1:1.0'

echo $USB_ADDR > /sys/bus/usb/drivers/usbhid/unbind
