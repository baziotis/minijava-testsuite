class Main {
  public static void main(String[] args) {
    int len;
    // Are these type errors? We could consider that
    // they're not but then it means we have to generate
    // code for them, or say that its codegen is ignored.
    args = args;
    args[0] = (args[0]) + (args[1]);
    len = args.length;
    System.out.println(args.length);
  }
}
