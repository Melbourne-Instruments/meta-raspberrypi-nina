#!/bin/sh

# Load libcomposite
modprobe libcomposite

# Create a gadget called usb-gadgets
cd /sys/kernel/config/usb_gadget/
mkdir -p usb-gadgets
cd usb-gadgets

# Configure our gadget details
echo 0x1d6b > idVendor # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # v1.0.0
echo 0x0200 > bcdUSB # USB2
mkdir -p strings/0x409
echo "fedcba9876543210" > strings/0x409/serialnumber
echo "Melbourne Instruments" > strings/0x409/manufacturer
echo "NINA USB MIDI" > strings/0x409/product
mkdir -p configs/c.1/strings/0x409
echo "Config 1: ECM network" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower

# Ethernet gadget
mkdir -p functions/ecm.usb0
# first byte of address must be even
HOST="48:6f:73:74:50:43" # "HostPC"
SELF="42:61:64:55:53:42" # "BadUSB"
echo $HOST > functions/ecm.usb0/host_addr
echo $SELF > functions/ecm.usb0/dev_addr
ln -s functions/ecm.usb0 configs/c.1/

# MIDI gadget
mkdir -p functions/midi.usb0
echo "nina-pi-midi" > functions/midi.usb0/id
ln -s functions/midi.usb0 configs/c.1/

# End functions
ls /sys/class/udc > UDC
ip link set usb0 up
ip addr add 10.0.0.1 dev usb0
