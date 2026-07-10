import 'dart:io';

//Extension
extension CurrencyFormatter on double {
  String formatCurrency() {
    return "৳${toStringAsFixed(2)}";
  }
}

//Abstract Class
abstract class Expense {
  String title;
  double amount;

  Expense(this.title, this.amount);

  String getCategory();

  void display() {
    print(
      "$title - ${amount.formatCurrency()} - ${getCategory()}",
    );
  }
}

//Child Classes
class FoodExpense extends Expense {
  FoodExpense(String title, double amount) : super(title, amount);

  @override
  String getCategory() => "Food";
}

class TransportExpense extends Expense {
  TransportExpense(String title, double amount) : super(title, amount);

  @override
  String getCategory() => "Transport";
}

class EntertainmentExpense extends Expense {
  EntertainmentExpense(String title, double amount) : super(title, amount);

  @override
  String getCategory() => "Entertainment";
}

//Main
void main() {
  List<Expense> expenses = [];

  while (true) {
    print("\n===== Expense Tracker =====");
    print("1. Add Expense");
    print("2. View All Expenses");
    print("3. Show Total Expenses");
    print("4. Exit");

    stdout.write("Choose Option: ");
    int choice = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    switch (choice) {
      case 1:
        addExpense(expenses);
        break;

      case 2:
        viewExpenses(expenses);
        break;

      case 3:
        showTotal(expenses);
        break;

      case 4:
        print("\nThank you for using Expense Tracker!");
        return;

      default:
        print("\nInvalid Option!");
    }
  }
}

//Functions

void addExpense(List<Expense> expenses) {
  stdout.write("\nEnter Expense Title: ");
  String title = stdin.readLineSync() ?? "";

  stdout.write("Enter Expense Amount: ");
  double amount =
      double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  stdout.write("Enter Category (Food/Transport/Entertainment): ");
  String category =
      (stdin.readLineSync() ?? "").trim().toLowerCase();

  Expense? expense;

  switch (category) {
    case "food":
      expense = FoodExpense(title, amount);
      break;

    case "transport":
      expense = TransportExpense(title, amount);
      break;

    case "entertainment":
      expense = EntertainmentExpense(title, amount);
      break;

    default:
      print("\nInvalid Category!");
      return;
  }

  expenses.add(expense);
  print("\nExpense Added Successfully!");
}

void viewExpenses(List<Expense> expenses) {
  if (expenses.isEmpty) {
    print("\nNo Expenses Found!");
    return;
  }

  print("\n===== All Expenses =====");

  for (int i = 0; i < expenses.length; i++) {
    stdout.write("${i + 1}. ");
    expenses[i].display();
  }
}

void showTotal(List<Expense> expenses) {
  double total = 0;

  for (Expense expense in expenses) {
    total += expense.amount;
  }

  print("\nTotal Expenses: ${total.formatCurrency()}");
}