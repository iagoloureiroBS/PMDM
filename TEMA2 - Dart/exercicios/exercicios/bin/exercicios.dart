// ignore_for_file: unused_local_variable

int facerOperacion(int num, int Function(int) operacion) => operacion(num);

int dobre(int num) => num * 2;
int triple(int num) => num * 3;

int compararNotas(int num1, int num2){
  return num1.compareTo(num2);
}


void main(List<String> args) {
  facerOperacion(5, dobre);
  print(facerOperacion(5, triple));

  List<int> notas = [1, 5, 9, 7, 2];
  notas.sort(compararNotas);
  print(notas);

  List<int> aprobadas = notas.where((x) => x >= 5).toList();
  List<int> suspensos = notas.where((x) => x < 5).toList();
  List<int> suspensos2 = notas.where((int x) {return x < 5;}).toList();

}

bool estaAprobado(int num){
    return num >= 5;
}
