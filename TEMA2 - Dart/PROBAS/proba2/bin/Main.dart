// ignore_for_file: unused_element, unused_local_variable

import 'dart:io';
// ignore: unused_import
import 'dart:vmservice_io';
typedef TipoLibro =({String nomeLibro, int anoLanzamento});

void main(){
  var nome = "Iago";
  var num = 23;
  int numero = 23;
  String cadea = "pepe";
  print(cadea.length);
  print(numero);
  String mensaxe = "Hola, chámome $nome e teño $num anos.";
  print(mensaxe);
  print("A cadea $cadea ten unha lonxitude de: ${cadea.length}");
  
  Object dato = "Un texto.";
  dato = 2;
  // print(valor.length);
  
  dynamic valor = "Un texto.";
  valor = 2;
  // print(valor.length);
  dynamic hora = DateTime.now();
  print(hora);

  String? mensaxeOpcional = null;
  print(mensaxeOpcional);
  cadea = mensaxeOpcional ?? "Hola Ca";
  print(cadea);
  print("");

  stdout.write("Introduce unha mensaxe:");
  String? mensaxePorTeclado = stdin.readLineSync();

  print(mensaxePorTeclado);

  String mensaxeProcesado = mensaxePorTeclado ?? "";

  int numeroIntroducido = int.tryParse(mensaxePorTeclado ?? "") ?? 0;

  const c = "Hola";
  // c = "Pedro";
  final c2 = "Adios";
  // c2 = "Messi";

  var _ = 34;

  String c3 = """ Hola
  que
  tal""";

  (String, int) rexistro = ("Iago", 34);
  print(rexistro);
  print("O primeiro campo é: ${rexistro.$1}\nO segundo campo é: ${rexistro.$2}");
  var name = rexistro.$1;
  print(name);
  ({String nomee, int idade}) rexistro2 = (nomee: "Iago", idade: 23);
  print(rexistro2);

  print("O primeiro campo é: ${rexistro2.nomee}\nO segundo campo é: ${rexistro2.idade}");


  TipoLibro libro = (nomeLibro: "O meu libro", anoLanzamento: 2027);
  TipoLibro libro2 = (nomeLibro: "O meu libro", anoLanzamento: 2027);
  TipoLibro libro3 = (nomeLibro: "O meu libro", anoLanzamento: 2027);

  int idade = 4;
  if (idade >= 18) {
    print('Maior de idade');
  } else {
    print('Menor de idade');
  }

  int nota = 3;
  switch (nota) {
    case >=9 && <=10: print("Sobresaínte");
    case >=7 && <9: print("Notable");
    case >=5 && <7: print("Suficiente");
    case >=0 && <5: print("Suspenso");
    default: print("Nota non válida");
  }

  bool isMaiorIdade(int idade){
    if(idade >= 18) return true;
    return false; 
  }
  int dobrarNumero (int numero) => numero * 2;
  
  int funcionAbrev (int numero) => numero > 0 ? numero * 2 : 0;


 List<String> alumnos = ["Pepe", "Ana"];

  print(alumnos[0]);
  alumnos[1] = "Xabier";
  print(alumnos[1]);
  alumnos.remove("Xabier");
  print(alumnos);
  alumnos.add("Lamine");

  presentar(nome: "Lamine");
  presentar(nome: "Messi", grupo: "FC Barcelona");
  presentar(grupo: "Brazil", nome: "Neymar");
  presentarNonNomeados("Pedri", "FCB");
  presentarNonNomeados("Iria");

  print(operacion(2));

  int Function(int) operacionE = (int num){
    return num * 3;
  };

  int Function(int) operacionE2 = (int num) => num * 4;

  int Function() operacionNoEntrada = () => 3*4;
  void Function() operacionNada = () => print(3*4);

  operacionNada();
  print(operacionNada);

}

void presentar({required String nome, String grupo = "2º DAM"}){
  print("Hola $nome, pertences ao grupo $grupo");
}

void presentarNonNomeados(String nome, [String grupo = "1º DAM"]){
  print("Hola $nome, pertences ao grupo $grupo");
}

int dobre(int num){
  return num*2;
}

int dobreSimple(int num) => num*2;
int triple(int num) => num*3;

int Function(int) operacion = dobre;

var operacion2 = dobre;

// CALLBACKS

void executarAccion(void Function() accion) {
  print("Comeza a acción");
  accion();
  print("Remata a acción");
}

void avisar (){
  print("AVISO");
}

void main2(List<String> args) {
  executarAccion(avisar);
  executarAccion(() {print("Ola Caracola");});

  executarAccion(() => print("Peperra"));

}






