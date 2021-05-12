class Main {
  public static void main(String[] irrelevant) {
    int[] c;
    int d;
    A a;
    a = new A();
    c = new int[2];
    c[1] = 1;
    if ((c[1]) < 2) {
      System.out.println(1);
    } else {
      if (((a.foo())[2]) < 0) {
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
  public int[] foo() {
    return (new int[200]);
  }

  public int bar(int a) {
    int res;
    if ((a < 2) && (0 < a)) {
      res = 1;
    } else {
      res = 2;
    }
    return res;
  }

  public int[] another() {
    return this.foo();
  }
}
