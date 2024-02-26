
// finanzas_personales_app.dart
import 'dart:io';

import 'package:proyecto/RegistroTransacciones/RegistroFinanzas.dart';
import 'package:proyecto/EstablecerMetas/EstablecerMetas.dart';
import 'package:proyecto/SeguimientoSaldo/EstadoFinanciero.dart';
import 'package:proyecto/EstablecerMetas/Meta.dart';

class FinanzasPersonalesApp {
  TransactionList tl;
  EstablecerMetas em;

  FinanzasPersonalesApp(this.tl, this.em);
  void ejecutar() {
    print('Bienvenido al Sistema de Gestión de Finanzas Personales');

    while (true) {
      try{
        print('\nSeleccione una opción:');
        print('1. Registrar transacción');
        print('2. Mostrar resumen financiero');
        print('3. Metas financieras');
        print('4. Salir');

        var opcion = int.parse(stdin.readLineSync() ?? '');

        switch (opcion) {
          case 1:
            registrarTransaccion();
            break;
          case 2:
            
            break;
          case 3:
            metas();
            break;
          case 4:
          print('Gracias por usar el sistema de gestion de finanzas ;)');
            return;
          default:
            print('Opción no válida. Por favor, elija una opción válida.');
            break;
        }
      }catch(e){
        print('Debe ingresar una opccion valida!');
      }
    }
  }

  void registrarTransaccion() {
    var type;
    var monto;
    try{
      print('Ingrese su tipo de transacción: 1.-Ingreso | 2.-Retiro');
      var tipo = int.tryParse(stdin.readLineSync() ?? '');
      
      switch(tipo){
        case 1:
          type='Ingreso';
          break;
        case 2:
          type='Retiro';
          break;
        default:
        print("Tipo de transacción incorrecta");
          return;
      } 
    }catch(e){
      print('Debe ingresar una opcion valida');
      return;
    }

    print('Ingrese la categoría de la transacción:');
    var categoria = stdin.readLineSync() ?? '';
    if (categoria.isEmpty || categoria == null){
      print('Debes indicar una categoría para tu transacción');
      return;
    }

    print('Ingrese el concepto de la transacción:');
    var concepto = stdin.readLineSync() ?? '';
    if (concepto.isEmpty || concepto == null){
      print('Debes indicar un concepto para tu transacción');
      return;
    }

    try{
      print('Ingrese el monto de la transacción:');
      monto = double.parse(stdin.readLineSync() ?? '');
      if(monto == null || monto <=  0) {
        print('Monto invalido');
        return;
      }
    }catch(e){
      print('Ingrese un valor numerico para el monto');
      return;
    }
    

    tl.addTransaction(type, concepto, monto, categoria);
    print('Transacción registrada exitosamente.');
  }

  void metas(){
    print('\nSeleccione una opción:');
      print('1. Establecer meta mensual');
      print('2. Establecer meta financiera');
      print('3. Ver el estado de mis metas');
      print('4. Salir');

      var opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
            
          break;
        case 2:
            establecerMetaFinanciera();
          break;
        case 3:
            mostrarEstadoMetas();
          break;
        case  4:
            break;
        default:
          print('Opción no válida. Por favor, elija una opción válida.');
          break;
      }
  }

  void establecerMetaFinanciera(){
    var estadoMeta = em.obtenerMetaFinanciera();
    if (estadoMeta == 0.0){
      print('Ingrese la cantidad que desea llegar:');
      double monto = double.parse(stdin.readLineSync()!);
      if(monto <= 0){
        print('Debe ingresar un valor valido');
        return;
      }
      em.establecerMetaFinanciera(monto);
    }
    else{
      print('Ya tienes una meta financiera establecida. ¿Deseas cambiarla? 1.- Si | 2.- No');
      var respuesta = int.parse(stdin.readLineSync()!);

      switch(respuesta){
        case 1:
          print('Ingrese el monto de su nueva meta: ');
          double nuevaMeta = double.parse(stdin.readLineSync()!);
          if(nuevaMeta <= 0){
            print('Debe ingresar un valor valido');
            return;
          }
          em.establecerMetaFinanciera(nuevaMeta);
          break;
        case 2:
          break;
        default:
          print('Opción no válida. Por favor.');
          return;
      }
    }
  }

  void  mostrarEstadoMetas(){
    print("================= Estado de las metas ===================");
    print('********* Meta Financiera *********');
    em.CalcularEstadoMetaFinanciera();
  }
}

void main() {
  var tl = TransactionList();
  var finanzas = EstadoFianaciero();
  var meta = Meta();
  var em = EstablecerMetas(meta, finanzas);

  var app = FinanzasPersonalesApp(tl, em);
  app.ejecutar();
}

