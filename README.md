# TempFanSpeedControllerPWM
Temperature sensing fan speed controller, based on ATTiny85 for Raspberry pi.

This circuit uses an ATTiny85 with a DS18B20 temperature sensor to create a PWM drive signal for a simple 2-wire 5V cooling fan. This controller is designed to be connected to pins 1-8 of a Raspberry Pi GPIO header, but it can really be connected to any 5V or 3.3V/5V system.
The DS18B20 temperature sensor should be connected by wires about 7cm long so the sensor can be placed right between the CPU and USB controllers on the pi.
The fan can be any 2-wire 5V fan that does not draw more than 200mA.

The default operating parameters will turn the fan on starting at about 23 C, ramping up to full fan speed at about 60 C. These values can be changed via i2c.

The controller design connects to the i2c bus of the host system so that temperature and fan speed can be monitored, and control parameters can be modified.
The controller design is also connected to GPIO pins on the Raspberry Pi so the ATTiny microcontroller firmware can be updated or reprogrammed directly within the Arduino IDE without requiring any kind of separate programmer, as it uses the avrdude in "linuxgpio" programming mode which bit bangs the AVR ISP protocol with GPIO pins.

direct Raspberry Pi programming ATTiny documented here: https://create.arduino.cc/projecthub/arjun/programming-attiny85-with-arduino-uno-afb829 except I power the chip from 3.3V which is safer for the Pi GPIO ports.

One caveat: if you use the Arduino/avrdude direct programming, this disables the i2c bus on the Pi so you will need to reboot the Pi after programming if you want to communicate with the controller.

the i2c address is 0x73 and the register map is located in the TempFanSpeedControllerPWM.ino file.

Reg 0: Current Temperature (Celsius, read)
Reg 1: Current Fan Speed (0x00 - 0xff proportional, read)
Reg 2: Temperature C when fan turns on (Celcius, read/write)
Reg 3: Temperature C when fan runs full speed (Celcius, read/write)
Reg 4: Minimum Fan Speed PWM (0x01 - 0xff proportional, read/write, default 0x34 empirically determined)
Reg 5: Maximum Fan Speed PWM (0x01 - 0xff proportional, read/write, default 0xff)
Reg 6: Override Fan Speed PWM (0x00 - 0xff proportional, read/write, 0=use temp sensing)
Reg 7: Save Registers to EEPROM (write, any non-zero value=save registgers)

to query current temperature:
i2cset -y 1 0x73 0
i2cget -y 1 0x73

to query current fan speed:
i2cset -y 1 0x73 1
i2cget -y 1 -x73

to set temperature (### C) when fan turns on:
i2cset -y 1 0x73 2 ###

to set temperature (### C) when fan reaches full speed:
i2cset -y 1 0x73 3 ###

to manually override fan speed (### = 0-0xff):
i2cset -y 1 0x73 6 ###

to save registers to EEPROM:
i2cset -y 1 0x73 7 1

