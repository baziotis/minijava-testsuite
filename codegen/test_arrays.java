class Main {
  public static void main(String[] args) {
    int size;
    int index;
    int sum;
    int[] int_array;
    int[] int_array_ref;
    boolean[] boolean_array;
    boolean flag;
    size = 1024;
    int_array = new int[(((size) + 1) - 1)];
    if ((!((int_array.length) < size)) && (!((size < (int_array.length))))) {
      System.out.println((int_array.length));
    } else {
      System.out.println(2020);
    }
    boolean_array = new boolean[(((size) + 1) - 1)];
    if ((!((boolean_array.length) < size)) &&
        (!((size < (boolean_array.length))))) {
      System.out.println((boolean_array.length));
    } else {
      System.out.println(2020);
    }
    index = 0;
    while (index < (int_array.length)) {
      int_array[index] = (index * 2);
      index = index + 1;
    }
    index = 0;
    int_array_ref = int_array;
    sum = 0;
    while (index < (int_array_ref.length)) {
      sum = (int_array_ref[index]) + sum;
      index = index + 1;
    }
    System.out.println(sum);
    index = 0;
    flag = true;
    while (index < (boolean_array.length)) {
      boolean_array[index] = flag;
      flag = !flag;
      index = index + 1;
    }
    index = 0;
    sum = 0;
    while (index < (boolean_array.length)) {
      if ((boolean_array[index])) {
        sum = sum + 1;
      } else {
        sum = sum + 10;
      }
      index = index + 1;
    }
    System.out.println(sum);
  }
}