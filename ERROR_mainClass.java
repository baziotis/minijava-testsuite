// But wait... we can't do stuff with mainClass.
// Same for the main method and its argument.

class Blah {
  public static void main(String[] a) {
    int a; // duplicate
  }
}
