//#define valueNum 3
const int echoPin1 = A0;
const int echoPin2 = A2;
const int trigPin1 = A1;
const int trigPin2 = A3;
int distance2;
int distance_2;

//TIMERS
unsigned long cTime;
unsigned long pTime;
int interval2 = 20;

void setup() {
  Serial.begin(9600);
  cTime = millis();
}

void loop() {
  distance_2 = distance2;
  if (cTime - pTime2 >= interval2) {
    pTime2 = cTime;
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
    distance2 = duration2 / 59;
  }

  int speed = (distance2 - distance_2) / 1;

  Serial.print(distance1);
  Serial.print('\t');
  //  Serial.println(duration_2-duration2);
  Serial.print(distance2);
  Serial.print('\t');
  Serial.print(distance_2);
  Serial.print('\t');
  Serial.println(speed);

  delay(200);
}



