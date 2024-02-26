import 'Transaction.dart';

class  TransactionList {
  List<Transaction> transactions = [];

  void addTransaction(String type, String concept, double amount, String category) {
    var newTransaction = Transaction(type, concept, category, amount);
    transactions.add(newTransaction);
  }
  TransactionList();
}