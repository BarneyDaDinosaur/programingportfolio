// Creating a Java class
class Box {
  // Declaring and initializing the attributes
  double l, w, h;
  
  //Constructor
  Box(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods
  public double calcVol() {
    double vol = l * w * h;
    return vol;
  }
  public double calcSurfAr() {
    double sa = (2 * (l * h)) + (2 * (h * w)) + (2 * (w * l));
    return sa;
  }
}