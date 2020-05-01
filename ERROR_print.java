class AnotherRandomName {
  public static void main(String[] irrelevant) {
    A a;
    int dummy;
    a = new A();
    dummy = a.foo();
  }
}

class A {
  public int foo() {
    boolean[] b;
    b = new boolean[20];
    System.out.println(b[2]);
    return 0;
  }
}
