import 'package:riverpod/riverpod.dart';
import '../services/budget_service.dart';

final budgetServiceProvider = Provider<BudgetService>((ref) {
  return BudgetService();
});
