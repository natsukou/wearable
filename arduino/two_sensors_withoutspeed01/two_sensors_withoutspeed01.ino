//#define valueNum 3
const int echoPin1 = A0;
const int echoPin2 = A4;
const int trigPin1 = A1;
const int trigPin2 = A5;


//TIMERS

void setup() {
  Serial.begin(9600);
}

void loop() {
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  int duration1 = pulseIn(echoPin1, HIGH);
  int distance1 = duration1 / 59;

  pinMode(echoPin2, INPUT);
  pinMode(trigPin2, OUTPUT);
  digitalWrite(trigPin2, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  int duration2 = pulseIn(echoPin2, HIGH);
  int distance2 = duration2 / 59;

  Serial.print(distance1);
  Serial.print('\t');
  //  Serial.println(duration_2-duration2);
  Serial.println(distance2);

  delay(200);
}




