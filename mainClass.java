// Making sure that we can do stuff with mainClass

class Blah {
  public static void main(String[] a) {
    int b;
    Blah blah;
    blah = new Blah();
    System.out.println(b);
  }
}

class B extends Blah {
  Blah main_;
  int a;
  boolean b;
  int[] c;
  C c2;
  boolean dummy;

  public int test() {
    return 1;
  }
}

class C extends B {
  public int test() {
    Blah b;
    return 2;
  }

  public int test2() {
    Receiver r;
    Blah main_;
    B b;
    C c;
    int dummy;
    dummy = r.receiveMain(main_);
    dummy = r.receiveMain(b);
    dummy = r.receiveMain(c);
    return 3;
  }
}

class Receiver {
  public int receiveMain(Blah b) {
    C c;
    B dummy;
    dummy = this.pass1(c);
    return 4;
  }

  public int final_(Blah main_) {
    return 2;
  }

  public int pass2(B b) {
    return this.final_(b);
  }

  public B pass1(C c) {
    int dummy;
    dummy = this.pass2(c);
    return this.get_C_give_B(c);
  }

  public B get_C_give_B(C c) {
    return c;
  }
}

// Shadow

class E {
  Blah b;
}

class D extends E {
  Blah b;
  public int test() {
    Blah b;
    return 5;
  }
}
