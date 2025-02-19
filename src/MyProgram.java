import java.util.Scanner;
public class MyProgram
{
    public static void main(String[] args)
    {
        boolean calcShape;
        calcShape = true;
            while(calcShape) {
            calcShape = false;
            Scanner scanner = new Scanner(System.in);
            Scanner calcs = new Scanner(System.in);
            System.out.println("Welcome! \nIf you would like to calculate a box, press 1 \nIf you would like to calculate a sphere, press 2 \nIf you would like to calculate a rectangular pyramid, press 3 \nIf you would like to calculate a dodecahedron, press 4 \nIf you would like to calculate something else, press 5");
            int shapeType = scanner.nextInt();
            if(shapeType == 1) {
                System.out.println("Box is selected");
                System.out.println("Please enter the length:");
                double length = scanner.nextDouble();
                System.out.println("Please enter the width:");
                double width = scanner.nextDouble();
                System.out.println("Please enter the height:");
                double height = scanner.nextDouble();
                Box box1 = new Box(length, width, height);
                System.out.println("Volume: " + box1.calcVol() + "\nSurface Area: " + box1.calcSurfAr());
            } else if(shapeType == 2) {
                System.out.println("Sphere is selected");
                System.out.println("Please enter the radius");
                double radius = scanner.nextDouble();
                Sphere sphere1 = new Sphere(radius);
                System.out.println("Volume: " + sphere1.calcVol() + "\nSurface Area: " + sphere1.calcSurfAr());
            } else if(shapeType == 3) {
                System.out.println("Rectangular Pyramid is selected");
                System.out.println("Please enter the length:");
                double lengthP = scanner.nextDouble();
                System.out.println("Please enter the width:");
                double widthP = scanner.nextDouble();
                System.out.println("Please enter the height:");
                double heightP = scanner.nextDouble();
                Pyramid pyr1 = new Pyramid(lengthP, widthP, heightP);
                System.out.println("Volume: " + pyr1.calcVol() + "\nSurface Area: " + pyr1.calcSurfAr());
            } else if(shapeType == 4) {
                System.out.println("Dodecahedron is selected");
                System.out.println("Please enter an edge length");
                double edge = scanner.nextDouble();
                Dodecahedron dodec1 = new Dodecahedron(edge);
                System.out.println("Volume: " + dodec1.calcVol() + "\nSurface Area: " + dodec1.calcSurfAr());
            } else if(shapeType == 5) {
                System.out.println("womp womp too bad");
            } else {
                System.out.println("enter one of the above please");
            }
            System.out.println("If you would like to finish another shape, press 6");
            System.out.println("If you would like to exit, press 9");
            int again = scanner.nextInt();
            if(again == 6) {
                calcShape = true;
            } else if(again == 9){
                calcShape = false;
            } else {
                calcShape = false;
            }
        }
    }
}