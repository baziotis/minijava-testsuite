// But wait... we can't do stuff with mainClass.
// Same for the main method and its argument.

class Main {
  public static void main(String[] args) {
    // Is this a type error? We could consider that
    // it isn't but then it means we have to generate
    // code for that, or say that its codegen is ignored.
    args = args;
  }
}
