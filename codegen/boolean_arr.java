class LetTheFunBegin {
  public static void main(String[] irrelevant) {
    B b;
    int[] c;
    int d;
    A a;
    a = new A();
    c = new int[2];
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

    d = a.bar(c[1]);
    System.out.println(d);
    d = a.bar((a.foo())[2]);
    System.out.println(d);

    b = new B();
    // Make sure that after filling the array which in
    // the middle of `B`, B.a and B.c have remain intact,
    // i.e. 0
    System.out.println(b.fill_arr()); // We don't care about this print
    System.out.println(b.get_a());
    if (b.get_c()) {
      d = 1;
    } else {
      d = 0;
    }
    System.out.println(d);

    // Out of bounds
    c[2] = c[1];
  }
}

class A {
  public int[] foo() {
    int[] b;
    b = new int[200];
    b[2] = true;
    return b;
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

  public int[] another() { return this.foo(); }
}

class B {
  int a;
  int[] b;
  boolean c;
  public int fill_arr() {
    int[] arr;
    int i;
    int len;
    len = 100;
    arr = new int[len];
    i = 0;
    while (i < len) {
      arr[i] = true;
      i = i + 1;
    }
    b = arr;
    return 0;
  }

  public int get_a() { return a; }

  public boolean get_c() { return c; }
}
