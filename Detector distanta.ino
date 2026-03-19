#define ECHO_PIN 2
#define TRIG_PIN 3

void setup() {
  Serial.begin(115200);       
  pinMode(TRIG_PIN, OUTPUT);  
  pinMode(ECHO_PIN, INPUT);   
}

void loop() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long durata = pulseIn(ECHO_PIN, HIGH);
  float distanta_cm = durata / 58.0;  

  if (distanta_cm <= 50) { 
  Serial.println(distanta_cm);
}

  delay(50); 
}