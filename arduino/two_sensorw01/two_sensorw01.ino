//#define valueNum 3
const int echoPin1 = A0;
const int echoPin2 = A1;
const int trigPin1 = A3;
const int trigPin2 = A4;
void setup() {

  Serial.begin(9600);

}

void loop() {
  //  for(int i=0;i<valueNum;i++){
  //    njlValue[i] = analogRead(i);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  int duration1 = pulseIn(echoPin1, HIGH);
  int distance1 = duration1 / 59;

  pinMode(echoPin2, INPUT);
  pinMode(trigPin2, OUTPUT);
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  int duration2 = pulseIn(echoPin2, HIGH);
  int distance2 = duration2 / 59;

  Serial.print(distance1);
  Serial.print('\t');
  Serial.println(distance2);

  delay(200);
}



