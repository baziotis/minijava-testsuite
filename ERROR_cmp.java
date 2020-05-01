class ERROR_cmp {
  public static void main(String[] a){ }
}

class Operator {
  boolean op1bool;
  int op2int;
  boolean result;
  
  public boolean compute() {
	  result = op1bool < op2int;
	  return result;
  }
}
