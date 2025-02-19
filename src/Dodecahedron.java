// Creating a Java class
class Dodecahedron {
  // Declaring and initializing the attributes
  double e;
  
  //Constructor
  Dodecahedron(double e) {
      this.e = e;
  }

  // methods
  public double calcVol() {
    double vol = ((15+(7 * Math.sqrt(5)))/(4))*Math.pow(e, 3);
    return vol;
  }
  public double calcSurfAr() {
      double sa = (3) * (Math.sqrt(25 + (10 * Math.sqrt(5)))) * (Math.pow(e, 2));
      return sa;
  }
}