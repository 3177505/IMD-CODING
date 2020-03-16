java.io.File folder;
String[] filenames;
PImage[] imgs;

void setup() {
  size(800, 800);
  frameRate(1);
  
  // Initialize arrays
  folder = new java.io.File(sketchPath("data"));
  filenames = folder.list();
  imgs = new PImage[filenames.length];
  
  // Populate image array with all images from the data folder
  // There should only be images in the folder, or it will throw an error!
  // A hidden .DS_STORE file (on a Mac) will let this fail for example

  for(int i = 0; i < filenames.length; i++) {
    imgs[i] = loadImage(filenames[i]);    
    // Optional: resize image (leave one argument as 0 to resize proportionally)
    imgs[i].resize(width, height);
  }

}

void draw() {
  // Pick two random indexes, aka which item we want to pick from the images array
  int randomIndex0 = int(random(filenames.length));
  int randomIndex1 = int(random(filenames.length));
  
  // Blend two images together using a custom function which accepts two parameters
  blendImages(imgs[randomIndex0], imgs[randomIndex1]);
  
  // Optional: save frame
  //saveFrame("####.jpg");
}

// Custom function which takes two parameters of type 'PImage'
  void blendImages(PImage img0, PImage img1) {
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        // Create temporary variables x and y (we could also just use i and j)
        int x = i;
        int y = j;
        // Create variable of type color and set to black
        color col = color(0);
        // Create two variables of type color which contain the current pixel color value
        color c0 = img0.get(x, y);
        color c1 = img1.get(x, y);
        
  
        // Decide what value the variable 'col' should be
        if (brightness(c0) > brightness(c1)) {
          col = c0;
        } else {
          col = c1;
        }
  
        // Set the pixel at position x, y to the value of color variable 'col'
        set(x, y, col);
      }
    }
  }

// Using a different technique to blend images
// Note: two function can not have the same name!

//void blendImages(PImage a, PImage b) {
//  image(a, 0, 0);
//  blend(b, 0, 0, width, height, 0, 0, width, height, SCREEN);
//  filter(BLUR, 3);
//  //filter(INVERT);
//  //filter(POSTERIZE, 3);
//  //filter(INVERT);
//}

// Optional: save the frame when you press a key, in this case the spacebar
void keyPressed() {
  if (key == ' ') {
    saveFrame(millis() + "####.jpg");
  }
}