// Reglas para validar.
class Validaciones {
  // Comprueba que un texto tenga contenido.
  static String texto(String valor) {
    if (valor.trim().isEmpty){
      throw ArgumentError('El texto no puede estar vacio.');
      }
    return valor.trim();

  }

  // Comprueba un numero dentro de los limites indicados.
  static int numero(int valor, {required int minimo, required int maximo}) {
    if (valor < minimo || valor > maximo) {
      throw ArgumentError('El valor debe estar entre $minimo y $maximo.');
    }
    return valor;
  }
}
