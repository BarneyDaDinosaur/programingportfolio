// Creating a Java class
class Pyramid {
  // Declaring and initializing the attributes
  double l, w, h;
  
  //Constructor
  Pyramid(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods
  public double calcVol() {
    double vol = (l * w * h) * 1/3;
    return vol;
  }
  public double calcSurfAr() {
      double sa = (l * w) + (l * (Math.sqrt(Math.pow((w/2) , 2.0) + Math.pow(h , 2.0)))) + (w * (Math.sqrt(Math.pow((l/2) , 2.0) + Math.pow(h , 2.0))));
      return sa;
  }
}