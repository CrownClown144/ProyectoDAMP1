import 'Meta.dart';
import '../SeguimientoSaldo/EstadoFinanciero.dart';

class EstablecerMetas{
  Meta meta;
  EstadoFianaciero finanzas;

  EstablecerMetas(this.meta, this.finanzas);

  void establecerMetaFinanciera(double metaFinanciera){
    meta.metaFinanciera = metaFinanciera;
  }

  double obtenerMetaFinanciera(){
    return meta.metaFinanciera;
  }

  void CalcularEstadoMetaFinanciera(){
    var saldo = finanzas.saldoActual;
    var metaFinanciera = meta.metaFinanciera;

    var porcentaje = saldo/metaFinanciera*100;

    if(porcentaje < 100){
      print("Haz recaudado un total de \$${saldo.toStringAsFixed(2)} de \$${metaFinanciera.toStringAsFixed(2)}");
      print("Total alcanzado: ${porcentaje.toStringAsFixed(2)}%");
    }
    else{
      print("Haz logrado tu meta financiera: \$${saldo.toStringAsFixed(2)} de \$${metaFinanciera.toStringAsFixed(2)}");
      print("Total alcanzado: ${porcentaje.toStringAsFixed(2)}%");
    }
  }
}
