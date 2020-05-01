class WhateverMain {
  public static void main(String[] irrelevant) {
    A a;
    int dummy;
    a = new A();
    dummy = a.foo();
  }
}

class A {
  public int foo() {
    int[] i;
    i = new int[20];
    System.out.println(i);
    return 0;
  }
}
