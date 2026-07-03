class BankAccount {
  double _balance = 0;

  // GETTER — read-only window into _balance
  double get balance => _balance;

  // SETTER — validated write access
  set balance(double value) {
    if (value < 0) {
      throw ArgumentError("Balance can't be negative");
    }
    _balance = value;
  }
}

void main() {
  var acc = BankAccount();
  acc.balance = 500;        // calls the SETTER, value checked
  print(acc.balance);       // calls the GETTER → 500
}