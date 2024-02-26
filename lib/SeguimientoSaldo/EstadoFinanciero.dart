import '../RegistroTransacciones/RegistroFinanzas.dart';

class EstadoFinanciero{
  double saldoActual = 0.0;
  double gastosTotales = 0.0;
  double  ingresosTotales = 0.0;
  
  TransactionList transactionList;
  EstadoFinanciero(this.transactionList);

  void mostrarResumenFinanciero(){
    for(var transaccion in transactionList.transactions){
      if(transaccion.type == 'Ingreso'){
        ingresosTotales += transaccion.amount;
      }
      else{
        gastosTotales+= transaccion.amount.abs();
      }
    }
    double saldoActual = ingresosTotales-gastosTotales;
    print('========RESUMEN DEL ESTADO FINANCIERO========');
    print('Ingresos: \$${ingresosTotales.toStringAsFixed(2)}');
    print('Gastos: \$${gastosTotales.toStringAsFixed(2)}');
    print('Saldo: \$${saldoActual.toStringAsFixed(2)}');
  }
}