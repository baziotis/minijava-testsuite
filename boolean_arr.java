class Main {
  public static void main(String[] irrelevant) {
    boolean[] c;
    int d;
    A a;
    a = new A();
    c = new boolean[2];
    c[1] = false;
    if (c[1]) {
      System.out.println(1);
    } else {
      if ((a.foo())[2]) {
        System.out.println(10);
      } else {
        System.out.println(20);
      }
    }

    c[1] = c[2];

    d = a.bar(c[1]);
    d = a.bar((a.foo())[2]);
  }
}

class A {
  public boolean[] foo() {
    return (new boolean[200]);
  }

  public int bar(boolean a) {
    int res;
    if (a) {
      res = 1;
    } else {
      res = 2;
    }
    return res;
  }

  public boolean[] another() {
    return this.foo();
  }
}
