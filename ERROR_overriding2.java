class Main {
  public static void main(String[] a) {}
}

// The parameter types don't match.
class I {
  public int foo(int a, int[] b) { return 3; }
}

class H extends I {
  public int foo() { return 1; }
}
