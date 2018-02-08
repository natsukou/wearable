class MoveX {
  PVector location;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float r;
  
  MoveX(float _x, float _y, float _r){
    location = new PVector(_x,_y);
    position = new PVector(_x,_y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = _r;
  
  }
  void call(float int0){
  move();
  sensor(int0);
  checkBoundaries();
  display();
  
  }
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void sensor(float int0){
    PVector move = new PVector(map(int0,0,50,-1,1),0);
    acceleration.add(move);
  }
  void checkBoundaries(){
    if(location.x<r||location.x>width-r) velocity.x*=-1;
  }
  void display(){
    fill(255);
    ellipse(location.x,location.y,r,r);
  }
}