#include <EEPROM.h>
#include <TinyWireS.h>
#include <OneWire.h>
#include <DallasTemperature.h>

#define I2C_SLAVE_ADDRESS 0x73 // i2c slave address of the device

// OneWire Data wire on gpio 3
#define ONE_WIRE_BUS 3

// fan speed pwm output on gpio 4
#define FAN_PWM_PIN 4

// control register addresses
#define REG_CURRENT_TEMP 0
#define REG_CURRENT_FAN_SPEED 1
#define REG_MIN_TEMP 2
#define REG_MAX_TEMP 3
#define REG_MIN_FAN_SPEED 4
#define REG_MAX_FAN_SPEED 5
#define REG_OVERRIDE_FAN_SPEED 6
#define REG_WRITE_EEPROM 7
#define REGS_COUNT 8

// register array for controlling device
uint8_t registers[REGS_COUNT];

// OneWire object for communicating with temp sensor
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
DeviceAddress sensor_address;

// default temp/speed range parameters
const uint8_t min_temp_c = 35; // temp C for min fan speed
const uint8_t max_temp_c = 60; // temp C for max fan speed
const uint8_t min_fan_speed = 52; // min fan pwm
const uint8_t max_fan_speed = 255; // max fan pwm

// current index of register to be read back
uint8_t register_index = 0;

// values to indicate eeprom contains valid registger data
#define MAGIC_BYTE_1 0x66
#define MAGIC_BYTE_2 0x73

void initialize_registers() {
  registers[REG_CURRENT_TEMP] = 0;
  registers[REG_CURRENT_FAN_SPEED] = max_fan_speed;
  registers[REG_MIN_TEMP] = min_temp_c;
  registers[REG_MAX_TEMP] = max_temp_c;
  registers[REG_MIN_FAN_SPEED] = min_fan_speed;
  registers[REG_MAX_FAN_SPEED] = max_fan_speed;
  registers[REG_OVERRIDE_FAN_SPEED] = 0;
  registers[REG_WRITE_EEPROM] = 0;
}

// save registers to eeprom
void save_registers() {
  EEPROM.write(0, MAGIC_BYTE_1);
  EEPROM.write(1, MAGIC_BYTE_2);
  for (int r=REG_MIN_TEMP; r<REGS_COUNT; ++r) {
    EEPROM.write(r, registers[r]);
  }
}

// load registgers from eeprom
void load_registers() {
  uint8_t mb1 = EEPROM.read(0);
  uint8_t mb2 = EEPROM.read(1);
  if ((mb1 == MAGIC_BYTE_1) && (mb2 == MAGIC_BYTE_2)) {
    for (int r=REG_MIN_TEMP; r<REGS_COUNT; ++r) {
      registers[r] = EEPROM.read(r);
    }
  }
}

void setup() {
  // reduce PWM frequency to reduce fan whine
  TCCR1 = (TCCR1 & 0xf0) | 0x0c;

  // turn on I2C pullups
  pinMode(0, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);

  // setup i2c slave
  TinyWireS.begin(I2C_SLAVE_ADDRESS);
  TinyWireS.onReceive(receiveEvent);
  TinyWireS.onRequest(requestEvent);

  // setup default temp/fan speed map
  initialize_registers();
  delay(1000);

  // full speed for a few seconds upon reset
  analogWrite(FAN_PWM_PIN, max_fan_speed);

  // retrieve registers from eeprom
  load_registers();
  delay(3000);

  // Start up the OneWire library
  sensors.begin();
  // search for the temperature sensor address
  sensors.getAddress(sensor_address, 0);

  // turn off fan for a few seconds
  analogWrite(FAN_PWM_PIN, 0);
  delay(2000);
}

void loop() {
  TinyWireS_stop_check();

  // check if eeprom register save command issued
  if (registers[REG_WRITE_EEPROM] != 0) {
    registers[REG_WRITE_EEPROM] = 0;
    save_registers();
  }

  // read temperature sensor
  sensors.requestTemperatures();
  uint8_t temp_c = (uint8_t) sensors.getTempC(sensor_address);
  registers[REG_CURRENT_TEMP] = temp_c;

  // compute new fan speed based on current temperature
  // assume fan will turn off (below min temp)
  uint16_t new_fan_speed = 0;
  if (temp_c >= registers[REG_MIN_TEMP]) {
    new_fan_speed = map(temp_c, registers[REG_MIN_TEMP], registers[REG_MAX_TEMP], registers[REG_MIN_FAN_SPEED], registers[REG_MAX_FAN_SPEED]);
    if (new_fan_speed < registers[REG_MIN_FAN_SPEED]) {
      new_fan_speed = 0;
    }
    if (new_fan_speed > registers[REG_MAX_FAN_SPEED]) {
      new_fan_speed = registers[REG_MAX_FAN_SPEED];
    }
  }
  // check if manual override is set for fan speed
  if (registers[REG_OVERRIDE_FAN_SPEED] != 0) {
    new_fan_speed = registers[REG_OVERRIDE_FAN_SPEED];
  }
  // change pwm if there is a change to fan speed
  if (new_fan_speed != registers[REG_CURRENT_FAN_SPEED]) {
    registers[REG_CURRENT_FAN_SPEED] = (uint8_t) new_fan_speed;
    analogWrite(FAN_PWM_PIN, registers[REG_CURRENT_FAN_SPEED]);
  }
}

// i2c request data from device
void requestEvent()
{
  // send value from current register index
  TinyWireS.write(registers[register_index]);
  ++register_index;
  if (register_index >= REGS_COUNT) {
    register_index = 0;
  }
}

// i2c data written to device
void receiveEvent(uint8_t byte_count) {
  if (byte_count < 1) {
    return;
  }
  // first byte will be register index
  uint8_t index = TinyWireS.read();
  if (index >= REGS_COUNT) {
    return;
  }
  register_index = index;
  --byte_count;
  // subsequent bytes will be values to save to registers
  while (byte_count > 0) {
    --byte_count;
    registers[register_index] = TinyWireS.read();
    ++register_index;
    if (register_index >= REGS_COUNT) {
      register_index = 0;
    }
  }
}
