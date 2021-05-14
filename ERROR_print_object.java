class Blah {
  public static void main(String[] irrelevant) {
    A a;
    int dummy;
    a = new A();
    dummy = a.foo();
  }
}

class A {
  public int foo() {
		C c;
		c = new C();
    System.out.println(c);
    return 0;
  }
}

class C {
	int a;
}
