class Main {
  public static void main(String[] args) {
    A a;
    B b;
    int[] int_array;
    int i;
    boolean flag;
    a = new A();
    b = new B();
    i = b.Init();
    int_array = new int[1000];
    i = 0;
    while (i < (int_array.length)) {
      int_array[i] = (i * 2);
      i = i + 1;
    }
    i = 0;
    flag = true;
    while (i < (int_array.length)) {
      flag = !flag;
      i = i + 1;
    }
    i = a.func(
        a.func_int(a.func_int(
            a.func_int(a.func_int(a.func_int(a.func_int(a.func_int(1024))))))),
        a.func_int_array(a.func_int_array(a.func_int_array(
            a.func_int_array(a.func_int_array(a.func_int_array(int_array)))))),
        a.func_boolean(a.func_boolean(a.func_boolean(a.func_boolean(
            a.func_boolean(a.func_boolean(a.func_boolean(true))))))),
        b.getB(b.getB(b.getB(b.getB(b.getB(b))))));
  }
}
class A {
  int data;
  public int func_int(int i) {
    data = i;
    return i;
  }
  public int[] func_int_array(int[] arr) { return arr; }
  public boolean func_boolean(boolean b) { return b; }
  public int decrease(int i) {
    i = i - 1;
    return i;
  }
  public int func(int i, int[] int_arr, boolean b, B c_b) {
    int j;
    int sum;
    System.out.println(data);
    System.out.println(i);
    System.out.println((int_arr.length));
    j = 0;
    sum = 0;
    while (j < (int_arr.length)) {
      sum = (int_arr[j]) + sum;
      j = j + 1;
    }
    System.out.println(sum);
    if (b) {
      System.out.println(1);
    } else {
      System.out.println(0);
    }
    System.out.println((int_arr.length));
    j = 0;
    sum = 0;
    if ((int_arr[j] < 0)) {
      sum = sum + 1;
    } else {
      sum = sum + 10;
    }
    System.out.println(sum);
    j = c_b.Print();
    return j;
  }
}
class B {
  int Data;
  public int Init() {
    Data = 1048576;
    return 1;
  }
  public int Print() {
    System.out.println(Data);
    return 1;
  }
  public B getB(B b) { return b; }
}
