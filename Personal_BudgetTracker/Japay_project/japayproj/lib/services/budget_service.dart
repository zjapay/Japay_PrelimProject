import '../models/expense.dart';

class BudgetService {
  final List<Expense> _expenses = [];

  void addExpense(String description, double amount) {
    final expense = Expense(description: description, amount: amount, date: DateTime.now());
    _expenses.add(expense);
    print('Expense "$description" of \$${amount.toStringAsFixed(2)} added successfully.');
  }

  List<Expense> listExpenses() {
    return _expenses;
  }

  double totalSpent() {
    return _expenses.fold(0, (sum, item) => sum + item.amount);
  }
}
