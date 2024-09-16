import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'providers/budget_provider.dart';
import 'services/budget_service.dart';


void main() {

  final container = ProviderContainer();
  final budgetService = container.read(budgetServiceProvider);

  runApp(budgetService);
}

void runApp(BudgetService budgetService) {
  bool running = true;

  while (running) {
    print('\n--- Personal Budget Tracker ---');
    print('Choose an option:');
    print('1. Add an expense');
    print('2. List all expenses');
    print('3. View spending summary');
    print('4. Exit');
    stdout.write('> ');

    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        _addExpense(budgetService);
        break;
      case '2':
        _listExpenses(budgetService);
        break;
      case '3':
        _viewSummary(budgetService);
        break;
      case '4':
        running = false;
        print('Exiting Personal Budget Tracker. Goodbye!');
        break;
      default:
        print('Invalid option. Please choose again.');
    }
  }
}

//Add expense
void _addExpense(BudgetService budgetService) {
  stdout.write('Enter expense description: ');
  final description = stdin.readLineSync();

  stdout.write('Enter amount: ');
  final amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  if (description != null && description.isNotEmpty && amount > 0) {
    budgetService.addExpense(description, amount);
  } else {
    print('Invalid input. Could not add expense.');
  }
}

//List all expense
void _listExpenses(BudgetService budgetService) {
  final expenses = budgetService.listExpenses();
  print('--- All Expenses ---');
  if (expenses.isEmpty) {
    print('No expenses found.');
  } else {
    for (var expense in expenses) {
      print(expense);
    }
  }
  print('--------------------');
}

//View spending summary
void _viewSummary(BudgetService budgetService) {
  final total = budgetService.totalSpent();
  print('--- Spending Summary ---');
  print('Total spent: \$${total.toStringAsFixed(2)}');
  print('------------------------');
}
