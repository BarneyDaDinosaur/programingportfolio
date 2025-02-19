// Creating a Java class
class Sphere {
  // Declaring and initializing the attributes
  double r;
  
  //Constructor
  Sphere(double r) {
      this.r = r;
  }

  // methods
  public double calcVol() {
    double vol = (4/3) * (Math.PI) * (r * r * r);
    return vol;
  }
  public double calcSurfAr() {
      double sa = 4 * Math.PI * (r * r);
      return sa;
  }
}