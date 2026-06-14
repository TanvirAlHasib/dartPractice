void main() {
  String ? name;
  int a = 10;
  int b = 20;

  print('Hello ${name ?? "user"}');

  print('Summation of a and b is ${a + b}');
  print('Subtraction of a and b is ${a-b}');
  print('Division of b and a is ${b/a}');
  print('Integer division of b and a is ${b ~/ a}');
  print('Mod of a and b is ${a%b}');

  Object value = -42;

  switch (value) {
    case int n when n < 0:
      print("Negative number: $n");
    case int m when m == 0: // it will still match the case but will not execute the print statement because the value is -42
      print("Zero");
    case int n:
      print("Positive int: $n");   // ← this matches 42
    case String s:
      print("A string: $s");
    default:
      print("Something else");
  }
}