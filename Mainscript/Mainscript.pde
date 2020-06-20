ArrayList<Segment> segments;
float radiusCircle;
float lenSegment;
float incrementAngle;
int nbrSegments;

void setup(){
  size(600, 600);
  radiusCircle = 200;
  lenSegment = 20;
  nbrSegments = 40;
  incrementAngle = 2*PI/nbrSegments;
  segments = new ArrayList<Segment>();
  Segment segment = new Segment(lenSegment, radiusCircle, incrementAngle, true);
  segments.add(segment);
  for(int i=1; i<nbrSegments; i++){
    segment = new Segment();
    segments.add(segment);
    segments.get(i).setPrecedent(segments.get(i-1));
  }
  segments.get(0).setPrecedent(segments.get(nbrSegments-1));
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  noFill();
  stroke(255);
  strokeWeight(3);
 
  for(Segment segment : segments){
    segment.update();
    segment.display();
  }
}
