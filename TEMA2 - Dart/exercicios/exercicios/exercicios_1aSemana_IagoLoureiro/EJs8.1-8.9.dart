// 8.1. Crear e chamar unha función
void saudar() {
  print("Ola!");
}

// 8.2. Sumar cunha frecha
int sumar(int a, int b) => a + b;

// 8.3. Omitir o tipo de retorno
sumarSenTipo(int a, int b) => a + b;

// 8.4. Parámetros nomeados obrigatorios
String formatearNome({required String nome, required String apelido}) {
  return '${nome.toUpperCase()} ${apelido.toUpperCase()}';
}

// 8.5. Parámetros nomeados anulables
String formatearNomeAnulable({String? nome, String? apelido}) {
  String n = nome != null ? nome.toUpperCase() : '';
  String a = apelido != null ? apelido.toUpperCase() : '';
  return '$n $a'.trim();
}

// 8.6. Valores por defecto
String crearEtiqueta({String cor = 'negro', int tamano = 12}) {
  return 'Etiqueta(cor=$cor, tamaño=$tamano)';
}

void main() {
  saudar();

  print(sumar(5, 7));

  print(sumarSenTipo(10, 20));

  print(formatearNome(nome: 'Diego', apelido: 'Rodicio'));

  print(formatearNomeAnulable(nome: 'Xoán', apelido: 'Pérez'));
  print(formatearNomeAnulable(nome: 'Xoán'));
  print(formatearNomeAnulable(apelido: 'Pérez'));

  print(crearEtiqueta());
  print(crearEtiqueta(cor: 'vermello', tamano: 16));
}