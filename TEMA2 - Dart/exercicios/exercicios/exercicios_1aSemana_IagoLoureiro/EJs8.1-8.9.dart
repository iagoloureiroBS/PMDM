// 8.1. Crear e chamar unha función
import 'dart:ffi';

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

// 8.9. Recibir unha operación
int aplicar(int x, int y, int Function(int,int) op) => op(x, y);
int restar(int x, int y) => x - y;

//8.12 Devolver un usuario
String crearUsuario(String nome, int idade) => "NOME: $nome IDADE: $idade"; 

({int minimo, int maximo}) minMax(List<int> lista){
  int max = -1000;
  int min = 10000;
  for (var n in lista){
    if(n < min){
      min = n;
    }
    if(n > max){
      max = n;
    }
  }
  var rex = (minimo: min, maximo: max);
    return rex;
}

//8.15 Resumo dunha factura
({double subtotal, double total, double iveFactura}) calcularFactura({
  required double prezo, 
  int unidades = 1, 
  double ive = 0.21 // Por defecto aplicamos un 21% de IVE
}) {
  
  double subtotal = prezo * unidades;
  double iveFactura = subtotal * ive;
  double total = subtotal + iveFactura;

  // Devolvemos os tres valores empaquetados nunha única variable (Rexistro)
  return (
    subtotal: subtotal, 
    total: total, 
    iveFactura: iveFactura
  );
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

  print(aplicar(3, 4, sumar));
  print(aplicar(6, 2, restar));
  print(aplicar(12, 2, (x, y) => x - y));

  // ignore: unused_local_variable
  int Function(int) funcionAnonima = (int x) => x * 3;
}