// finanzas_personales_app.dart
import 'dart:io';

import 'package:proyecto/RegistroTransacciones/RegistroFinanzas.dart';
import 'package:proyecto/RegistroTransacciones/Transaction.dart';

class FinanzasPersonalesApp {
  TransactionList rf =  new TransactionList();
  void ejecutar() {
    print('Bienvenido al Sistema de Gestión de Finanzas Personales');

    while (true) {
      print('\nSeleccione una opción:');
      print('1. Registrar transacción');
      print('2. Mostrar resumen financiero');
      print('3. Salir');

      var opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          registrarTransaccion();
          break;
        case 2:
          mostrarResumenFinanciero();
          break;
        case 3:
          print('Gracias por usar el Sistema de Gestión de Finanzas Personales. ¡Hasta luego!');
          return;
        default:
          print('Opción no válida. Por favor, elija una opción válida.');
      }
    }
  }

  void registrarTransaccion() {
    print('Ingrese el concepto de la transacción:');
    var concepto = stdin.readLineSync() ?? '';
    print('Ingrese el monto de la transacción:');
    var monto = double.parse(stdin.readLineSync() ?? '');

    print('Seleccione la categoría de la transacción:');
    print('1. Alimentación');
    print('2. Transporte');
    print('3. Vivienda');
    print('4. Entretenimiento');

    var categoria = Category.values[int.parse(stdin.readLineSync() ?? '') - 1];

    rf.addTransaction(concepto, monto, categoria);
    print('Transacción registrada exitosamente.');
  }

  void mostrarResumenFinanciero() {
    rf.mostrarResumenFinanciero();
  }
}

void main() {
  var app = FinanzasPersonalesApp();
  app.ejecutar();
}
