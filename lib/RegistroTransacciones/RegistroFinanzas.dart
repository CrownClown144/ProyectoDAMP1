import 'Transaction.dart';

class  TransactionList {
  List<Transaction> transactions = [];
  double saldoActual = 0.0;

  void addTransaction(String type, String concept, double amount, String category) {
      var newTransaction = Transaction(type, concept, category, amount);
      transactions.add(newTransaction);
  }

  double obtenerSaldo(){
    double gastosTotales = 0.0;
    double  ingresosTotales = 0.0;
      for(var transaccion in transactions){
        if(transaccion.type == 'Ingreso'){
          ingresosTotales += transaccion.amount;
        }
        else{
          gastosTotales+= transaccion.amount.abs();
        }
      }
      saldoActual = ingresosTotales-gastosTotales;
      return saldoActual;
  }


  TransactionList();
}