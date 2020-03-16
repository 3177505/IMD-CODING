PImage img0;
PImage img1;

void setup() {
  size(800, 800);

  // Load images
  img0 = loadImage("image0.jpg");
  img1 = loadImage("image1.jpg");
  
  // Optional: resize images
  img0.resize(width, height);
  img1.resize(width, height);
  
  // Blend the two images together based on conditions
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
      // The condition in the if-statement determines which color to pick
      if (hue(c0) > hue(c1)) {
        col = c0;

        // Or create a new color entirely
        //col = color(red(c1), green(c0), blue(c0));
        //col = color(blue(c1), red(c1), saturation(c0));
        //col = color(brightness(c0), saturation(c1), red(c0));
      } else {
        col = c1;
        
        // Or create a new color entirely
        //col = color(red(c1), green(c0), blue(c0));
        //col = color(blue(c1), red(c1), saturation(c0));
        //col = color(brightness(c0), saturation(c1), red(c0));
      }

      // Set the pixel at position x, y to the value of color variable 'col'
      set(x, y, col);
    }
  }
  
  println("We have manipulated " + (width * height) + " pixels!");
}
