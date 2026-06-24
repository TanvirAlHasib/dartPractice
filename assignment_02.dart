import 'dart:io';

void main(){

  Set<String> courses = {"Flutter", "Dart", "Git"};

  bool isNewStudent = true;

  List<String> studentName_01 = ["Tanmoy", "Sakib"];

  List<String> studentName_02 = [
    "Rahat",
    "Nafis",
    if(isNewStudent) "Rahim"
  ];

  List<String> studentName = [...studentName_01, ...studentName_02];

  Map<String, int> age = {
    "Tanmoy" : 22,
    "Sakib" : 23,
    "Rahat" : 21,
    "Nafis" : 24,
    "Rahim" : 20
  };

  print("Students:");
  stdout.write(studentName);
  print("\n");
  print("Courses:");
  stdout.write(courses);
  print("\n");
  print("Student Ages:");
  for(var ages in age.entries){
    print("${ages.key} -> ${ages.value}");
  }

}