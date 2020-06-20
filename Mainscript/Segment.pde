class Segment{
  Segment precedent;
  float size;
  float radCircle;
  float angle;
  float curr_angle;
  boolean turning;
  
  Segment(float s, float rc, float a, boolean t){
    this.size = s;
    this.radCircle = rc;
    this.angle = a;
    this.turning = t;
  }
  
  Segment(){
    this.size = lenSegment;
    this.radCircle = radiusCircle;
    this.angle = incrementAngle;
    this.turning = false;
  }
  
  void setPrecedent(Segment segment) {
    this.precedent = segment;
  }
  
  void update(){
    if(this.precedent.curr_angle > PI/3){
      this.turning = true;
    }
    if(this.turning){
      this.curr_angle += 0.1;
      if(this.curr_angle > 2*PI){
        this.curr_angle = 0;
        this.turning = false;
      }
    }
  }
  
  void display(){
    rotate(this.angle);
    translate(0, this.radCircle + sin(curr_angle/2)*30);
    rotate(this.curr_angle);
    line(-this.size/2, 0, this.size/2, 0);
    rotate(-this.curr_angle);
    translate(0, -(this.radCircle + sin(curr_angle/2)*30));
  }
}
