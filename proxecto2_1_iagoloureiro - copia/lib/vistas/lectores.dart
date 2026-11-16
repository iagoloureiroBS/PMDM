import 'dart:io';

import '../modelo/validaciones.dart';

// Lectores comunes.
class Lectores {
  // Leer una linea. Si se cierra, terminar el programa.
  static String linea(String pregunta) {
    stdout.write(pregunta);
    String? entrada = stdin.readLineSync();
    if (entrada == null) throw StateError('Fin de la entrada.');
    return entrada.trim();
  }

  // Leer un texto. Enter mantiene el valor al modificar.
  static String texto(String pregunta, {String? actual}) {
    while (true) {
      String valor = linea(pregunta);
      if (valor.isEmpty && actual != null) return actual;
      try {
        return Validaciones.texto(valor);
      } on ArgumentError catch (error) {
        print(error.message);
      }
    }
  }

  // Leer un numero y comprobar su rango.
  static int numero(
    String pregunta, {
    required int minimo,
    required int maximo,
    int? actual,
  }) {
    while (true) {
      String entrada = linea(pregunta);
      if (entrada.isEmpty && actual != null) return actual;
      int? valor = int.tryParse(entrada);
      if (valor == null) {
        print('Introduce un numero entero.');
        continue;
      }
      try {
        return Validaciones.numero(valor, minimo: minimo, maximo: maximo);
      } on ArgumentError catch (error) {
        print(error.message);
      }
    }
  }

  // Pedir confirmacion con s o n.
  static bool confirmar(String pregunta) {
    while (true) {
      String respuesta = linea('$pregunta (s/n): ').toLowerCase();
      if (respuesta == 's') return true;
      if (respuesta == 'n') return false;
      print('Escribe s o n.');
    }
  }
}
