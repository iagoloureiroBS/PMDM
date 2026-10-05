// 5.1. Modificar unha lista final
void main() {
  final cores = ['vermello', 'azul', 'verde'];
  
  // cores = ['amarelo', 'negro']; 
  // Da un erro de compilación porque cores é unha variable final.

  cores.add('branco'); 
  print(cores); 
  // Funciona.

// 5.2. Substituír dynamic nunha lista
  List<int> valor = [1, 2, 3];
  print(valor.first + valor.last);

// 5.4. Primeiro e último elemento
  List<String> nomes = ['Iago', 'Diego', 'Ana'];
  print('Primeiro: ${nomes.first}, Último: ${nomes.last}');

// 5.6. Cambiar e eliminar posicións
  List<String> coresBasicas = ['vermello', 'verde', 'azul'];
  coresBasicas[1] = 'amarelo';
  coresBasicas.removeAt(0);
  print(coresBasicas);

// 5.7. Tamaño e lista baleira
  List<int> numeros = [10, 20, 30];
  print('Tamaño: ${numeros.length}, Está baleira?: ${numeros.isEmpty}');
  numeros.clear();
  print('Tamaño tras clear: ${numeros.length}, Está baleira?: ${numeros.isEmpty}');

// 5.8. Buscar nunha lista
  List<String> froitas = ['mazá', 'pera', 'mazá', 'kiwi'];
  print('Índice da primeira mazá: ${froitas.indexOf('mazá')}');
  print('Contén banana?: ${froitas.contains('banana')}');

// 5.10. Acceder a unha matriz
  List<List<int>> matriz = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  print('Fila 2, Columna 1: ${matriz[2][1]}');

// 5.18. Sumar só os enteiros
  List<Object> datosMixtos = [1, 'Diego', 3];
  int sumaEnteiros = 0;
  
  for (var elemento in datosMixtos) {
    if (elemento is int) {
      sumaEnteiros += elemento;
    }
  }
  
  print('Suma dos enteiros: $sumaEnteiros');
}