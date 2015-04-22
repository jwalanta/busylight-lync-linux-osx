import usb.core
import usb.util
import sys

# find our device
dev = usb.core.find(idVendor=0x04d8, idProduct=0xf848)

# was it found?
if dev is None:
	raise ValueError('Device not found')

# set the active configuration. With no arguments, the first
# configuration will be the active onedev.set_configuration()

# get an endpoint instance
cfg = dev.get_active_configuration()
intf = cfg[(0,0)]

ep = usb.util.find_descriptor(
				intf,
				# match the first OUT endpoint
				custom_match = \
						lambda e: \
						usb.util.endpoint_direction(e.bEndpointAddress) == \
						usb.util.ENDPOINT_OUT)

assert ep is not None

# write the data
arg = sys.argv[1].lower()
if (arg == 'red' or arg == 'busy' or arg == 'do not disturb' or arg == 'in a meeting'):
	ep.write('\x00\x00\x11\x00\x00\x00\x00\x00')
elif (arg == 'green' or arg == 'available'):
	ep.write('\x00\x00\x00\x11\x00\x00\x00\x00')
else:
	ep.write('\x00\x00\x11\x11\x00\x00\x00\x00')
