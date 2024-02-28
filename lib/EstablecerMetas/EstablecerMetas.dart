import 'Meta.dart';
import '../SeguimientoSaldo/EstadoFinanciero.dart';

class EstablecerMetas{
  Meta meta;
  EstadoFinanciero finanzas;

  EstablecerMetas(this.meta, this.finanzas);

  void establecerMetaFinanciera(double metaFinanciera){
    meta.metaFinanciera = metaFinanciera;
  }

  void establecerPresupuestoMensual(double presupuesto){
    meta.presupuestoMensual = presupuesto;
  }

  double obtenerPresupuestoMensual(){
    return meta.presupuestoMensual;
  }

  double obtenerMetaFinanciera(){
    return meta.metaFinanciera;
  }

  void CalcularEstadoMetaFinanciera(){
    if(meta.metaFinanciera == 0.0){
      print("No tienes una meta  financiera establecida");
    }else {
      var saldo = finanzas.saldoActual;
      var metaFinanciera = meta.metaFinanciera;
      meta.porcentajeMeta = saldo/metaFinanciera*100;

      if(meta.porcentajeMeta < 100){
        print("Haz recaudado un total de \$${saldo.toStringAsFixed(2)} de \$${metaFinanciera.toStringAsFixed(2)}");
        print("Total alcanzado: ${meta.porcentajeMeta.toStringAsFixed(2)}%");
      }
      else{
        print("Haz logrado tu meta financiera: \$${saldo.toStringAsFixed(2)} de \$${metaFinanciera.toStringAsFixed(2)}");
        print("Total alcanzado: ${meta.porcentajeMeta.toStringAsFixed(2)}%");
      }
    }
  }

  void calculoMeta(){
      var saldo = finanzas.saldoActual;
      var metaFinanciera = meta.metaFinanciera;
      meta.porcentajeMeta = saldo/metaFinanciera*100;
  }

  void calculoPre(){
      var presupuesto = meta.presupuestoMensual;
      var gastoTotal = meta.estadoPresupuesto;

      meta.porcentajePre =  gastoTotal/presupuesto *  100 ;
  }


  double obtenerPorcentajeMeta(){
    return meta.porcentajeMeta;
  }

  double obtenerPorcentajePre(){
    return meta.porcentajePre;
  }

  void  agregarIngreso(double ingreso){
    meta.estadoPresupuesto += ingreso;
  }

  void CalcularEstadoPresupuestoMensual(){
    if(meta.presupuestoMensual == 0.0){
      print("No tienes un presupuesto mensual establecido!");
    }else{
      var presupuesto = meta.presupuestoMensual;
      var gastoTotal = meta.estadoPresupuesto;

      meta.porcentajePre =  gastoTotal/presupuesto *  100 ;


      if(meta.porcentajePre < 100){
        print("Haz gastado un total de \$${gastoTotal.toStringAsFixed(2)} de \$${presupuesto.toStringAsFixed(2)}");
        print("Total alcanzado: ${meta.porcentajePre.toStringAsFixed(2)}%");
      }
      else{
        print("Haz sobrepasado tu meta financiera: \$${gastoTotal.toStringAsFixed(2)} de \$${presupuesto.toStringAsFixed(2)}");
        print("Total alcanzado: ${meta.porcentajePre.toStringAsFixed(2)}%");
      } 
    }
  }
}
