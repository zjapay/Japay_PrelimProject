class Expense {
  final String description;
  final double amount;
  final DateTime date;

  Expense({
    required this.description,
    required this.amount,
    required this.date,
  });

  @override
  String toString() {
    return '$description - \$${amount.toStringAsFixed(2)} on ${date.toLocal().toIso8601String().split('T').first}';
  }
}
