EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5D49D788
P 2900 4000
F 0 "U1" H 2370 4046 50  0000 R CNN
F 1 "ATtiny85-20PU" H 2370 3955 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2900 4000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 2900 4000 50  0001 C CNN
	1    2900 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5D49D8CF
P 5300 2400
F 0 "J1" H 5350 2717 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 5350 2626 50  0000 C CNN
F 2 "" H 5300 2400 50  0001 C CNN
F 3 "~" H 5300 2400 50  0001 C CNN
	1    5300 2400
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:DS18B20 U2
U 1 1 5D49D9D1
P 4600 4000
F 0 "U2" H 4371 4046 50  0000 R CNN
F 1 "DS18B20" H 4371 3955 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3600 3750 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 4450 4250 50  0001 C CNN
	1    4600 4000
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5D49DB78
P 6300 4100
F 0 "J2" H 6380 4092 50  0000 L CNN
F 1 "Conn_01x02" H 6380 4001 50  0000 L CNN
F 2 "" H 6300 4100 50  0001 C CNN
F 3 "~" H 6300 4100 50  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5D49DE10
P 7100 4100
F 0 "J3" H 7020 4317 50  0000 C CNN
F 1 "Conn_01x02" H 7020 4226 50  0000 C CNN
F 2 "" H 7100 4100 50  0001 C CNN
F 3 "~" H 7100 4100 50  0001 C CNN
	1    7100 4100
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5D49DEBD
P 5800 5100
F 0 "Q1" H 5991 5146 50  0000 L CNN
F 1 "2N3904" H 5991 5055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6000 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5800 5100 50  0001 L CNN
	1    5800 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5D49E00D
P 2200 3050
F 0 "C1" H 2315 3096 50  0000 L CNN
F 1 "10000pF" H 2315 3005 50  0000 L CNN
F 2 "" H 2238 2900 50  0001 C CNN
F 3 "~" H 2200 3050 50  0001 C CNN
	1    2200 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D49E0B3
P 5100 5100
F 0 "R1" V 5307 5100 50  0000 C CNN
F 1 "220" V 5216 5100 50  0000 C CNN
F 2 "" V 5030 5100 50  0001 C CNN
F 3 "~" H 5100 5100 50  0001 C CNN
	1    5100 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5D49E274
P 4200 3650
F 0 "R2" H 4270 3696 50  0000 L CNN
F 1 "10K" H 4270 3605 50  0000 L CNN
F 2 "" V 4130 3650 50  0001 C CNN
F 3 "~" H 4200 3650 50  0001 C CNN
	1    4200 3650
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan M?
U 1 1 5D49E660
P 8300 4200
F 0 "M?" H 8458 4296 50  0000 L CNN
F 1 "Fan" H 8458 4205 50  0000 L CNN
F 2 "" H 8300 4210 50  0001 C CNN
F 3 "~" H 8300 4210 50  0001 C CNN
	1    8300 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49E770
P 5900 3000
F 0 "#PWR?" H 5900 2750 50  0001 C CNN
F 1 "GND" H 5905 2827 50  0000 C CNN
F 2 "" H 5900 3000 50  0001 C CNN
F 3 "" H 5900 3000 50  0001 C CNN
	1    5900 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49E7B0
P 2200 3400
F 0 "#PWR?" H 2200 3150 50  0001 C CNN
F 1 "GND" H 2205 3227 50  0000 C CNN
F 2 "" H 2200 3400 50  0001 C CNN
F 3 "" H 2200 3400 50  0001 C CNN
	1    2200 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49E7F0
P 2900 4950
F 0 "#PWR?" H 2900 4700 50  0001 C CNN
F 1 "GND" H 2905 4777 50  0000 C CNN
F 2 "" H 2900 4950 50  0001 C CNN
F 3 "" H 2900 4950 50  0001 C CNN
	1    2900 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49E830
P 5900 5600
F 0 "#PWR?" H 5900 5350 50  0001 C CNN
F 1 "GND" H 5905 5427 50  0000 C CNN
F 2 "" H 5900 5600 50  0001 C CNN
F 3 "" H 5900 5600 50  0001 C CNN
	1    5900 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D49E870
P 4600 4600
F 0 "#PWR?" H 4600 4350 50  0001 C CNN
F 1 "GND" H 4605 4427 50  0000 C CNN
F 2 "" H 4600 4600 50  0001 C CNN
F 3 "" H 4600 4600 50  0001 C CNN
	1    4600 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2900 2200 2800
Wire Wire Line
	2200 2800 2900 2800
Wire Wire Line
	2900 2800 2900 3400
Wire Wire Line
	2200 3200 2200 3400
Wire Wire Line
	2900 4600 2900 4950
$Comp
L power:+3.3V #PWR?
U 1 1 5D49EBC6
P 2900 2450
F 0 "#PWR?" H 2900 2300 50  0001 C CNN
F 1 "+3.3V" H 2915 2623 50  0000 C CNN
F 2 "" H 2900 2450 50  0001 C CNN
F 3 "" H 2900 2450 50  0001 C CNN
	1    2900 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D49ED42
P 4550 1800
F 0 "#PWR?" H 4550 1650 50  0001 C CNN
F 1 "+3.3V" H 4565 1973 50  0000 C CNN
F 2 "" H 4550 1800 50  0001 C CNN
F 3 "" H 4550 1800 50  0001 C CNN
	1    4550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D49ED82
P 4600 3400
F 0 "#PWR?" H 4600 3250 50  0001 C CNN
F 1 "+3.3V" H 4615 3573 50  0000 C CNN
F 2 "" H 4600 3400 50  0001 C CNN
F 3 "" H 4600 3400 50  0001 C CNN
	1    4600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2450 2900 2800
Connection ~ 2900 2800
Wire Wire Line
	4550 1800 4550 2300
Wire Wire Line
	4550 2300 5100 2300
Wire Wire Line
	4600 3400 4600 3500
Wire Wire Line
	4200 3500 4600 3500
Connection ~ 4600 3500
Wire Wire Line
	4600 3500 4600 3700
Wire Wire Line
	4300 4000 4200 4000
Wire Wire Line
	4200 3800 4200 4000
Connection ~ 4200 4000
Wire Wire Line
	4200 4000 3500 4000
Wire Wire Line
	4600 4300 4600 4600
Wire Wire Line
	5900 5300 5900 5600
Wire Wire Line
	5250 5100 5600 5100
Wire Wire Line
	3500 4100 4100 4100
Wire Wire Line
	4100 4100 4100 5100
Wire Wire Line
	4100 5100 4950 5100
Wire Wire Line
	5900 4200 5900 4900
Wire Wire Line
	6100 4200 5900 4200
Wire Wire Line
	7300 4100 7700 4100
Wire Wire Line
	7700 4100 7700 3800
Wire Wire Line
	7700 3800 8300 3800
Wire Wire Line
	8300 3800 8300 3900
Wire Wire Line
	8300 4400 8300 4500
Wire Wire Line
	8300 4500 7700 4500
Wire Wire Line
	7700 4500 7700 4200
Wire Wire Line
	7700 4200 7300 4200
Wire Wire Line
	3500 4200 4000 4200
Wire Wire Line
	4000 4200 4000 2900
Wire Wire Line
	4000 2900 5700 2900
Wire Wire Line
	5700 2900 5700 2600
Wire Wire Line
	5700 2600 5600 2600
$Comp
L power:+5V #PWR?
U 1 1 5D4A295C
P 6000 1800
F 0 "#PWR?" H 6000 1650 50  0001 C CNN
F 1 "+5V" H 6015 1973 50  0000 C CNN
F 2 "" H 6000 1800 50  0001 C CNN
F 3 "" H 6000 1800 50  0001 C CNN
	1    6000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2400 6000 2400
Wire Wire Line
	6000 2400 6000 1800
$Comp
L power:+5V #PWR?
U 1 1 5D4A2EA3
P 6100 3400
F 0 "#PWR?" H 6100 3250 50  0001 C CNN
F 1 "+5V" H 6115 3573 50  0000 C CNN
F 2 "" H 6100 3400 50  0001 C CNN
F 3 "" H 6100 3400 50  0001 C CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2500 5900 2500
Wire Wire Line
	5900 2500 5900 3000
Wire Wire Line
	6100 3400 6100 4100
Wire Wire Line
	3500 3700 3550 3700
Wire Wire Line
	3550 3700 3550 2400
Wire Wire Line
	3550 2400 5100 2400
Wire Wire Line
	3500 3800 3650 3800
Wire Wire Line
	3650 3800 3650 2600
Wire Wire Line
	3650 2600 5100 2600
Wire Wire Line
	3500 3900 3800 3900
Wire Wire Line
	3800 3900 3800 2500
Wire Wire Line
	3800 2500 5100 2500
Text Label 4750 2300 0    50   ~ 0
3.3V
Text Label 3750 2400 0    50   ~ 0
GPIO2-SDA-MOSI
Text Label 4050 2500 0    50   ~ 0
GPIO3-SCL-SCK
Text Label 4050 2600 0    50   ~ 0
GPIO4-MISO
Text Label 4450 2900 0    50   ~ 0
GPIO14-\RESET
Text Notes 7150 6900 0    118  ~ 0
TempFanSpeedController
Text Notes 9100 7650 2    79   ~ 0
2019-08-06
Text Notes 10750 7650 2    79   ~ 0
1
$EndSCHEMATC
