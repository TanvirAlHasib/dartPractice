import 'dart:io';

abstract class Person {
  void addStudent(String name);
  void viewStudent();
  void searchStudent(String name);
  void deleteStudent(String name);
}

class Student extends Person{

  List<String> _studentList = [];

  @override
  void addStudent(String name) => _studentList.add(name);

  @override
  void viewStudent() {
    print(_studentList); 
  }

  @override
  void searchStudent(String name) {
    bool isFound = (){
      for(String student in _studentList){
        if(student == name){
          return true;
        }
      }
      return false;
    }();
    print(isFound ? "Student found" : "Student not found");
  }

  @override
  void deleteStudent(String name) {
    if (_studentList.remove(name)) {
      print("Student deleted");
    } else {
      print("Student not found");
    }
  }
}

void main() {
  Person student = Student();

  print("===== Student Information Manager =====\n\n");
  while(true){
    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit\n\n");

    stdout.write("Choose: ");

    String? choice = stdin.readLineSync();

    if(choice == "5"){
      print("Exiting...");
      break;
    }
  
    chooseOption(choice, student);
  }
}

void chooseOption(String? choice, Person student){
  switch(choice){
      case "1":
        stdout.write("Enter student name to add: ");
        String? nameToAdd = stdin.readLineSync();
        if(nameToAdd != null && nameToAdd.isNotEmpty){
          student.addStudent(nameToAdd);
          print("Student added successfully.\n");
        } else {
          print("Invalid name.\n");
        }
      case "2":
        student.viewStudent();
        print("\n");
      case "3":
        stdout.write("Enter student name to search: ");
        String? nameToSearch = stdin.readLineSync();
        if(nameToSearch != null && nameToSearch.isNotEmpty){
          student.searchStudent(nameToSearch);
          print("\n");
        } else {
          print("Invalid name.\n");
        }
      case "4":
        stdout.write("Enter student name to delete: ");
        String? nameToDelete = stdin.readLineSync();
        if(nameToDelete != null && nameToDelete.isNotEmpty){
          student.deleteStudent(nameToDelete);
          print("\n");
        } else {
          print("Invalid name.\n");
        }
      default:
        print("Invalid option. Please try again.");
    }
}