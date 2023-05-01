
// Include libraries 
#include <HardwareSerial.h>
#include <TMCStepper.h>

#define ledChannel_1 1
#define ledChannel_2 2
#define ledChannel_3 6
#define ledChannel_4 4

// Define Pins
//------------------------------------------------------------------------
// Motor 1 (H1) Ringefinger 
#define Step_1 47
#define DIR_1 48 // HIGH == CLOSING
#define Current_1 36
#define Enn_1 45
#define PSR_A_1 05
#define FSR_1 6

// Motor 2 (H2) Lillefinger
#define Step_2 13
#define DIR_2 14 // LOW == CLOSING
#define Current_2 35
#define Enn_2 21
#define PSR_A_2 07
#define FSR_2 15

// Motor 3 (H3) Pegefinger
#define Step_3 10
#define DIR_3 11 // LOW == CLOSING
#define Current_3 20
#define Enn_3 12
#define PSR_A_3 16
#define FSR_3 17

// Motor 4 (H4) Langefinger
#define Step_4 3
#define DIR_4 46 // HIGH == CLOSING
#define Current_4 19
#define Enn_4 9
#define PSR_A_4 18
#define FSR_4 8

// Binary PSR sensor's
#define Sensor_Clock 38
#define Sensor_Lach 39
#define Sensor_Data 37

// Display LED's
#define LED_Clock 42
#define LED_Lach 41
#define LED_Data 40

// Battery voltage
#define Battery_measurement 4

// PDN_UART pins for drivers
#define PDN_UART_TXD 1
#define PDN_UART_RXD 2
//------------------------------------------------------------------------

// Serial port for driver communication
#define SERIAL_PORT Serial2 


// Driver and adresses 
#define DRIVER_ADDRESS_1   0b00
#define DRIVER_ADDRESS_2   0b01 
#define DRIVER_ADDRESS_3   0b10 
#define DRIVER_ADDRESS_4   0b11  

// Current sensing resistor
#define R_SENSE          0.12f
#define STALL_VALUE      2 

// Init motors
TMC2209Stepper driver1(&SERIAL_PORT, R_SENSE , DRIVER_ADDRESS_1 );
TMC2209Stepper driver2(&SERIAL_PORT, R_SENSE , DRIVER_ADDRESS_2 );
TMC2209Stepper driver3(&SERIAL_PORT, R_SENSE , DRIVER_ADDRESS_3 );
TMC2209Stepper driver4(&SERIAL_PORT, R_SENSE , DRIVER_ADDRESS_4 );

// Magic Variables 
int Number_Of_LEDs             =       5;
int Number_Of_Sensors          =       8;
int Standard_Frequency         =   12000; 
const long SERIAL_BAUD_RATE    =  250000;

// Maybe add comment for this (endestop i begge retninger)
bool Binary_PSR_values[8] = {true,true,true,true,true,true,true,true};

void setup() {
  
   // Init serial communication
   Serial.begin(SERIAL_BAUD_RATE);
   Serial2.begin(SERIAL_BAUD_RATE, SERIAL_8N1, PDN_UART_RXD, PDN_UART_TXD);

   // Set motors
   //------------------------------------------------------------------------
   int Microsteps_init = 4;
   int Rms_current_init = 800;
   // Motor 1
   driver1.begin();
   driver1.toff(4); // [1..15]
   driver1.blank_time(24); // [16, 24, 36, 54]
   driver1.rms_current(Rms_current_init); // Set stepper current to 500mA.
   driver1.microsteps(Microsteps_init);
   driver1.TCOOLTHRS(0xFFFFF); // 20bit max
   driver1.semin(0);
   driver1.semax(2);
   driver1.shaft(false);
   driver1.sedn(0b01);
   driver1.SGTHRS(STALL_VALUE);
   // Motor 2
   driver2.begin();
   driver2.toff(4); // [1..15]
   driver2.blank_time(24); // [16, 24, 36, 54]
   driver2.rms_current(Rms_current_init); // Set stepper current to 500mA.
   driver2.microsteps(Microsteps_init);
   driver2.TCOOLTHRS(0xFFFFF); // 20bit max
   driver2.semin(0);
   driver2.semax(2);
   driver2.shaft(false);
   driver2.sedn(0b01);
   driver2.SGTHRS(STALL_VALUE);
   // Motor 3
   driver3.begin();
   driver3.toff(4); // [1..15]
   driver3.blank_time(24); // [16, 24, 36, 54]
   driver3.rms_current(Rms_current_init); // Set stepper current to 500mA.
   driver3.microsteps(Microsteps_init);
   driver3.TCOOLTHRS(0xFFFFF); // 20bit max
   driver3.semin(0);
   driver3.semax(2);
   driver3.shaft(false);
   driver3.sedn(0b01);
   driver3.SGTHRS(STALL_VALUE);
   // Motor 4
   driver4.begin();
   driver4.toff(4); // [1..15]
   driver4.blank_time(24); // [16, 24, 36, 54]
   driver4.rms_current(Rms_current_init); // Set stepper current to 500mA.
   driver4.microsteps(Microsteps_init);
   driver4.TCOOLTHRS(0xFFFFF); // 20bit max
   driver4.semin(0);
   driver4.semax(2);
   driver4.shaft(false);
   driver4.sedn(0b01);
   driver4.SGTHRS(STALL_VALUE);
   //------------------------------------------------------------------------
   
   // Pin setup
   //------------------------------------------------------------------------
   // Motor 1
   pinMode(Step_1, OUTPUT);
   pinMode(DIR_1, OUTPUT);
   pinMode(Current_1, OUTPUT);
   pinMode(Enn_1, OUTPUT);
   pinMode(PSR_A_1, INPUT);
   pinMode(FSR_1, INPUT);

   // Motor 2
   pinMode(Step_2, OUTPUT);
   pinMode(DIR_2, OUTPUT);
   pinMode(Current_2, OUTPUT);
   pinMode(Enn_2, OUTPUT);
   pinMode(PSR_A_2, INPUT);
   pinMode(FSR_2, INPUT);

   // Motor 3
   pinMode(Step_3, OUTPUT);
   pinMode(DIR_3, OUTPUT);
   pinMode(Current_3, OUTPUT);
   pinMode(Enn_3, OUTPUT);
   pinMode(PSR_A_3, INPUT);
   pinMode(FSR_3, INPUT);
   
   // Motor 4
   pinMode(Step_4, OUTPUT);
   pinMode(DIR_4, OUTPUT);
   pinMode(Current_4, OUTPUT);
   pinMode(Enn_4, OUTPUT);
   pinMode(PSR_A_4, INPUT);
   pinMode(FSR_4, INPUT);

   // Binary PSR sensor's
   pinMode(Sensor_Clock, OUTPUT);
   pinMode(Sensor_Lach, OUTPUT);
   pinMode(Sensor_Data, INPUT);

   // Display LED's
   pinMode(LED_Clock, OUTPUT);
   pinMode(LED_Lach, OUTPUT);
   pinMode(LED_Data, OUTPUT);

   // Configure LED PWM functionalitites
   ledcSetup(ledChannel_1, 110, 8);
   ledcSetup(ledChannel_2, 200, 8);
   ledcSetup(ledChannel_3, 300, 8);
   ledcSetup(ledChannel_4, 400, 8);
  
   // Attach the channel to the GPIO to be controlled
   ledcAttachPin(Step_1, ledChannel_1);
   ledcAttachPin(Step_2, ledChannel_2);
   ledcAttachPin(Step_3, ledChannel_3);
   ledcAttachPin(Step_4, ledChannel_4);

   
   // User messege 
   Serial.println("Running pogram");
   /*
   Serial.println(driver1.test_connection());
   Serial.println(driver2.test_connection());
   Serial.println(driver3.test_connection());
   Serial.println(driver4.test_connection());
   */
}

void loop() {
  // Init main loop

  ledcWrite(ledChannel_1, 120);
  ledcWrite(ledChannel_2, 120);
  ledcWrite(ledChannel_3, 120);
  ledcWrite(ledChannel_4, 120);
  
  //calibrate sensor (voltages)
  //------------------------------------------------------------------------
  // Supply
  float Force_on_motor_1        = 0;
  float Force_on_motor_2        = 0;
  float Force_on_motor_3        = 0;
  float Force_on_motor_4        = 0;

  float Force_on_motor_1_max    = 3.3;
  float Force_on_motor_2_max    = 3.3;
  float Force_on_motor_3_max    = 0.69;
  float Force_on_motor_4_max    = 3.3;

  float Force_on_motor_1_min    = 0;
  float Force_on_motor_2_min    = 0;
  float Force_on_motor_3_min    = 0.54;
  float Force_on_motor_4_min    = 0;

  // Demand
  float Force_from_finger_1     = 0.13;
  float Force_from_finger_2     = 0.13;
  float Force_from_finger_3     = 0.13;
  float Force_from_finger_4     = 0.13;

  float Force_from_finger_1_max = 3.3;
  float Force_from_finger_2_max = 3.3;
  float Force_from_finger_3_max = 3.3;
  float Force_from_finger_4_max = 3.3;
  
  float Force_from_finger_1_min = 0;
  float Force_from_finger_2_min = 0;
  float Force_from_finger_3_min = 0;
  float Force_from_finger_4_min = 0;

  float speed_motor_1           = 0;
  float speed_motor_2           = 0;
  float speed_motor_3           = 0;
  float speed_motor_4           = 0;

  //Tune control parameter
  //------------------------------------------------------------------------------------------------------------
  float Kp                      = 5000;
  float limit_scale             = 1000;

  int k                         =  300;                               // constant jerk value rad/s^3
  int C1                        =   20;                               // Init acceleration rad/s^2
  int C2                        =   10;                               // Init speed rad/s
  int Steps                     = 2000;                               // Fill steps pr revolution
  int Microstepping             =   64; 
  float k_2                     = (Steps*Microstepping)/(2*3.141592); //conversion from rads to hz

  uint32_t Timer                = millis();
  uint32_t Sampel_time          =   1;
  
  while(1){
    
    //Sampler---------------------------------------------------------------------------------------------------
    if((millis() - Timer) >= Sampel_time){   
      Timer = millis();
      
      // Update sensor value  
      //---------------------------------------------------------------------------------------------------------
      Force_on_motor_1 = Filter(Force_on_motor_1, Get_Analog_PSR(PSR_A_1));
      Force_on_motor_2 = Filter(Force_on_motor_2, Get_Analog_PSR(PSR_A_2));
      Force_on_motor_3 = Filter(Force_on_motor_3, Get_Analog_PSR(PSR_A_3));
      Force_on_motor_4 = Filter(Force_on_motor_4, Get_Analog_PSR(PSR_A_4));
      /*
      Serial.print("Force_on_motor_1: ");
      Serial.println(Force_on_motor_1);
      Serial.print("Force_on_motor_2: ");
      Serial.println(Force_on_motor_2);
      Serial.print("Force_on_motor_3: ");
      Serial.println(Force_on_motor_3);
      Serial.print("Force_on_motor_4: ");
      Serial.println(Force_on_motor_4);
      */

      Force_from_finger_1 = Filter(Force_from_finger_1, Get_FSR(FSR_1)); 
      Force_from_finger_2 = Filter(Force_from_finger_2, Get_FSR(FSR_2)); 
      Force_from_finger_3 = Filter(Force_from_finger_3, Get_FSR(FSR_3)); 
      Force_from_finger_4 = Filter(Force_from_finger_4, Get_FSR(FSR_4)); 
      /*
      Serial.print(Force_from_finger_1: ");
      Serial.println(Force_from_finger_1);
      Serial.print("Force_from_finger_2: ");
      Serial.println(Force_from_finger_2);
      Serial.print("Force_from_finger_3: ");
      Serial.println(Force_from_finger_3);
      Serial.print("Force_from_finger_4: ");
      Serial.println(Force_from_finger_4;
      */

      // Controller  
      //---------------------------------------------------------------------------------------------------------
  
      speed_motor_1 = Kp*(Force_from_finger_1 - (Force_on_motor_1*Force_from_finger_1_min)/Force_on_motor_1_min);
      speed_motor_2 = Kp*(Force_from_finger_2 - (Force_on_motor_2*Force_from_finger_2_min)/Force_on_motor_2_min);
      speed_motor_3 = Kp*(Force_from_finger_3 - (Force_on_motor_3*Force_from_finger_3_min)/Force_on_motor_3_min);
      speed_motor_4 = Kp*(Force_from_finger_4 - (Force_on_motor_4*Force_from_finger_4_min)/Force_on_motor_4_min);
       
      // Output
      //---------------------------------------------------------------------------------------------------------
        /*
        ledcChangeFrequency(ledChannel_1, 3000, 8);
        ledcChangeFrequency(ledChannel_2, 3000, 8);
        ledcChangeFrequency(ledChannel_3, 3000, 8);
        ledcChangeFrequency(ledChannel_4, 3000, 8);
        Serial.println(Force_from_finger_3);
        if(Force_from_finger_3 < 0.13){
          digitalWrite(DIR_1,LOW); //HIGH == CLOSING
          digitalWrite(DIR_2,HIGH); //LOW == CLOSING
          digitalWrite(DIR_3,HIGH); //LOW == CLOSING
          digitalWrite(DIR_4,LOW); //HIGH == CLOSING
        } else {
          digitalWrite(DIR_1,HIGH); //HIGH == CLOSING
          digitalWrite(DIR_2,LOW); //LOW == CLOSING
          digitalWrite(DIR_3,LOW); //LOW == CLOSING
          digitalWrite(DIR_4,HIGH); //HIGH == CLOSING
        }
        */
        Set_speed(speed_motor_1, 1);
        Set_speed(speed_motor_2, 2);
        Set_speed(speed_motor_3, 3);
        Set_speed(speed_motor_4, 4);

     }

     // Update Info
     //------------------------------------------------------------------------------------------------------
     //Print_All();
     
     Set_display_LED(Battery_voltage());
      
     Get_Binary_PSR();
     
     /* 
     if((Binary_PSR_values[0] != 0 )||(Binary_PSR_values[1] != 0 )){
      tone(Step_1,0);
     }
     if((Binary_PSR_values[2] != 0 )||(Binary_PSR_values[3] != 0 )){
      tone(Step_2,0);
     }
     if((Binary_PSR_values[4] != 0 )||(Binary_PSR_values[5] != 0 )){
      tone(Step_3,0);
     }
     if((Binary_PSR_values[6] != 0 )||(Binary_PSR_values[7] != 0 )){
      tone(Step_4,0);
     }  
     */
  }
}

float Battery_voltage(){ 
  
  float Bits = 4095.0;
  float ESP_voltage = 3.33;
  
  return analogRead(Battery_measurement) * (2 * ESP_voltage / Bits);
}

float Flip(float In_max ,float in_min, float out_max, float out_min, float in){
  -((in-in_min)/(in_max-in_min))*(out_max-out_min)+out_max
}

((0.5-0.2)/(3-0.2))*(0.5-1)+1

void Set_speed(int Hz, int motor){
  

  switch (motor) {
  case 1:
  
    if (Hz < 0){
      digitalWrite(DIR_1,LOW); //LOW == OPENING
    } else {
      digitalWrite(DIR_1,HIGH); //HIGH == CLOSING
    }

    if ((Hz < 150) && (Hz > -150)){
      ledcWrite(ledChannel_1, 0);
    } else {
      ledcWrite(ledChannel_1, 120);
    }
    
    ledcChangeFrequency(ledChannel_1, abs(Hz), 8);
    
    break;
    
  case 2:
  
    if (Hz < 0){
      digitalWrite(DIR_2,HIGH); //HIGH == OPENING
    } else {
      digitalWrite(DIR_2,LOW); //LOW == CLOSING
    }

    if ((Hz < 150) && (Hz > -150)){
      ledcWrite(ledChannel_2, 0);
    } else {
      ledcWrite(ledChannel_2, 120);
    }
    
    ledcChangeFrequency(ledChannel_2, abs(Hz), 8);
    
    break;

  case 3:
  
    if (Hz < 0){
      digitalWrite(DIR_3,HIGH); //HIGH == OPENING
    } else {
      digitalWrite(DIR_3,LOW); //LOW == CLOSING
    }

    if ((Hz < 150) && (Hz > -150)){
      ledcWrite(ledChannel_3, 0);
    } else {
      ledcWrite(ledChannel_3, 120);
    }
    
    ledcChangeFrequency(ledChannel_3, abs(Hz), 8);
    
    break;

  case 4:
  
    if (Hz < 0){
      digitalWrite(DIR_4,LOW); //LOW == OPENING
    } else {
      digitalWrite(DIR_4,HIGH); //HIGH == CLOSING
    }

    if ((Hz < 150) && (Hz > -150)){
      ledcWrite(ledChannel_4, 0);
    } else {
      ledcWrite(ledChannel_4, 120);
    }
    
    ledcChangeFrequency(ledChannel_4, abs(Hz), 8);
    
    break;
    
  default:
    // if nothing else matches, do nothing
    break;
}
  
  
}

float Filter(float old_value, float new_value){ 
  
  return old_value + ((new_value - old_value)/6);
}

void Set_display_LED(float Batterry_Voltage){

  int LEDs_On[] = { 1, 1, 1, 1, 1, 1, 1, 1}; 
  
  if(Batterry_Voltage >= 3.7){

  } else if(Batterry_Voltage >= 3.6) {

    LEDs_On[0] = 1;
    LEDs_On[1] = 1; 
    LEDs_On[2] = 1;
    LEDs_On[3] = 1;
    LEDs_On[4] = 1;
    LEDs_On[5] = 1;
    LEDs_On[6] = 0;
    LEDs_On[7] = 1;
    
  } else if(Batterry_Voltage >= 3.5) {
    
    LEDs_On[0] = 1;
    LEDs_On[1] = 1; 
    LEDs_On[2] = 0;
    LEDs_On[3] = 1;
    LEDs_On[4] = 1;
    LEDs_On[5] = 1;
    LEDs_On[6] = 0;
    LEDs_On[7] = 1;
    
  } else if(Batterry_Voltage >= 3.4) {

    LEDs_On[0] = 1;
    LEDs_On[1] = 1; 
    LEDs_On[2] = 0;
    LEDs_On[3] = 0;
    LEDs_On[4] = 1;
    LEDs_On[5] = 1;
    LEDs_On[6] = 0;
    LEDs_On[7] = 1;
    
  } else if(Batterry_Voltage >= 3.3) {
    
    LEDs_On[0] = 1;
    LEDs_On[1] = 1; 
    LEDs_On[2] = 0;
    LEDs_On[3] = 0;
    LEDs_On[4] = 0;
    LEDs_On[5] = 1;
    LEDs_On[6] = 0;
    LEDs_On[7] = 1;
    
  } else {
    
    LEDs_On[0] = 1;
    LEDs_On[1] = 1; 
    LEDs_On[2] = 0;
    LEDs_On[3] = 0;
    LEDs_On[4] = 0;
    LEDs_On[5] = 0;
    LEDs_On[6] = 0;
    LEDs_On[7] = 1;

  }


  for(int i = 0; i < 8; i++){
    
    if(LEDs_On[i] == 1){
      digitalWrite(LED_Data,HIGH);
    } else {
      digitalWrite(LED_Data,LOW);
    }
    
    delay(1);
    digitalWrite(LED_Clock,HIGH);
    delay(1);
    digitalWrite(LED_Clock,LOW);
  }

  delay(10);
  digitalWrite(LED_Lach,HIGH);
  delay(10);
  digitalWrite(LED_Lach,LOW);
  
}

void Get_Binary_PSR(){


  digitalWrite(Sensor_Lach,LOW);
  delay(1);
  digitalWrite(Sensor_Lach,HIGH);
  delay(1);
  
  for(int i = 0; i < Number_Of_Sensors; i++){

    Binary_PSR_values[i] = digitalRead(Sensor_Data);

    if(digitalRead(Sensor_Data)){
      
    }

    digitalWrite(Sensor_Clock,HIGH);
    delay(1);
    digitalWrite(Sensor_Clock,LOW);
    delay(1);
  }

}

float Get_Analog_PSR(int SensorNumber){
  
  float Bits = 4095.0;
  float ESP_voltage = 3.33;
  float U2 = analogRead(SensorNumber) * ( ESP_voltage / Bits);
  float R2 = 50 * pow(10,3);
  float R1 = R2 * (ESP_voltage - U2) / U2;
  
  return  U2;

}

float Get_FSR(int SensorNumber){
  
  float Bits = 4095.0;
  
  float ESP_voltage = 3.3;
  float U2 = analogRead(SensorNumber) * (ESP_voltage / Bits);
  float R2 = 24 * pow(10, 3);
  
  float R1 = (R2 * (ESP_voltage - U2)) / U2;
  
  return  U2;

}

void Print_All(){

  float Voltage = 0;
  float Res = 0;
  
  

    Voltage = Battery_voltage();
    Serial.print("battery voltage: ");
    Serial.println(Voltage);
    
    Get_Binary_PSR(); 
    Serial.print("Binary_PSR_values: ");
    for(int i = 0; i < Number_Of_Sensors; i++){
      Serial.print(Binary_PSR_values[i]);
      Serial.print(" ");
    }
    
    Serial.println("");

    Res = Get_Analog_PSR(PSR_A_1);
    Serial.print("Analog value 1: ");
    Serial.println(Res);

    Res = Get_Analog_PSR(PSR_A_2);
    Serial.print("Analog value 2: ");
    Serial.println(Res);

    Res = Get_Analog_PSR(PSR_A_3);
    Serial.print("Analog value 3: ");
    Serial.println(Res);

    Res = Get_Analog_PSR(PSR_A_4);
    Serial.print("Analog value 4: ");
    Serial.println(Res);


    Res = Get_FSR(FSR_1);
    Serial.print("FSR value 1: ");
    Serial.println(Res);

    Res = Get_FSR(FSR_2);
    Serial.print("FSR value 2: ");
    Serial.println(Res);

    Res = Get_FSR(FSR_3);
    Serial.print("FSR value 3: ");
    Serial.println(Res);

    Res = Get_FSR(FSR_4);
    Serial.print("FSR value 4: ");
    Serial.println(Res);
    

} 




  
