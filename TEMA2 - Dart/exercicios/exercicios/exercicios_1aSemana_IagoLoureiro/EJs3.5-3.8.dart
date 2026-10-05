// 3.5. Un teléfono anulable
class FichaUsuario {
  final int identificador;
  String nome;
  String? telefono;

  FichaUsuario(this.identificador, this.nome, {this.telefono});

  void mostrarFicha() {
    print('ID: $identificador | Nome: $nome | Teléfono: ${telefono ?? "Sen teléfono"}');
    print('Resposta: Gardamos o teléfono como texto porque non realizamos operacións matemáticas con el e necesitamos conservar posibles ceros á esquerda, espazos ou símbolos como o "+".');
  }
}

void main() {
  FichaUsuario fichaDiego = FichaUsuario(1, 'Diego Rodicio');
  fichaDiego.mostrarFicha();

// 3.6. Consultar a lonxitude con seguridade
  String? s = null;
  print(s?.length ?? 0);

// 3.7. Comprobar e converter tipos
  dynamic datoDesconocido = 'Isto é unha cadea de texto';
  
  if (datoDesconocido is String) {
    String datoConvertido = datoDesconocido as String;
    print(datoConvertido.toUpperCase());
  }

// 3.8. Asignar só se falta un valor
  String? valorPorDefecto;
  valorPorDefecto ??= 'Valor asignado porque era null';
  print(valorPorDefecto);
}