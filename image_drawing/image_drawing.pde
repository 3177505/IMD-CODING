PImage img;

int numDrawers = 100;
 
void setup() {
  size(600,1000);
  background(255);
  img = loadImage("04.png");
}
 
void draw() {
  for (int i=0; i<numDrawers; i++) {
    float x = noise(0.01*frameCount+i/10)*width*2-width/2;
    float y = noise(0.01*frameCount+2*i)*height*2-height/2;
    int index = constrain(int(x) + int(y) * img.width, 0, img.pixels.length-1);
    color c = img.pixels[index];
    float theta = map(brightness(c), 0,255, 0, TWO_PI);
    pushMatrix();
    translate(x, y);
    rotate(theta);
    if (random(1)<0.2) {
      noStroke();
      fill(c,75);
      float r = random(1, 2);
      ellipse(0,0,r,r);
    } else {
      stroke(c);
      ellipse(0, 0, 5, 5);
    }
    popMatrix();
  }
}