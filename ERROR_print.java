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
    int[] b;
    b = new int[20];
    System.out.println(b);
    return 0;
  }
}
