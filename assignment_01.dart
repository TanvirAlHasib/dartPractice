import 'dart:io';

void main(){

  String studentName;
  String value;
  int marks;

  print("Student Report");
  print("\n");

  stdout.write("name:");
  studentName = stdin.readLineSync().toString();

  stdout.write("Marks:");
  marks = int.parse(stdin.readLineSync().toString());

  if (marks > 100 || marks < 0) {
    return;
  }

  if (marks >= 80 && marks <= 100) {
    print("Grade: A");
    value = "A";
  } else if(marks <= 79 && marks >= 70){
    print("Grade:B");
    value = "B";
  } else if(marks >= 60 && marks <= 69){
    print("Grade:C");
    value = "C";
  } else {
    print("Grade:F");
    value = "F";
  }

  print("\n");
  switch (value) {
    case "A":
      print("Excellent");
    case "B":
      print("Good Job");
    case "C":
      print("Good");
    default:
      print("Try your best");
  }

}