class Main {
  public static void main(String[] a) {}
}

class B {
  public int[] overriden(int a) { return new int[10]; }
}

// Invalid overloading
// The return types don't match.
class A extends B {
  public int overriden(int a) { return 1; }
}

