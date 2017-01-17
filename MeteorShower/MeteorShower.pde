Meteor[] mets = new Meteor[10];

void setup() {
  size(1000,800);
  background(0);
  for (int i = 0; i < mets.length; i++) {
    mets[i] = new Meteor();
  }
}

void draw() {
  fill(0,20);
  rect(0,0,width,height);
  
  noStroke();
  fill(239, 156, 88, 255);
  for (int i = 0; i < mets.length; i++) {
    mets[i].fall();
  }
}