import 'Transaction.dart';

class  TransactionList {
  List<Transaction> transactions = [];

  void addTransaction(String concept, double amount, Category category) {
    var newTransaction = Transaction(concept, amount, category);
    transactions.add(newTransaction);
  }

  void mostrarResumenFinanciero() {
    double ingresos = 0;
    double gastos = 0;

    for (var transaccion in transactions) {
      if (transaccion.amount > 0) {
        ingresos += transaccion.amount;
      } else {
        gastos += transaccion.amount.abs();
      }
    }

    double saldo = ingresos - gastos;

    print('Resumen Financiero:');
    print('Ingresos: \$${ingresos.toStringAsFixed(2)}');
    print('Gastos: \$${gastos.toStringAsFixed(2)}');
    print('Saldo: \$${saldo.toStringAsFixed(2)}');
  }
}