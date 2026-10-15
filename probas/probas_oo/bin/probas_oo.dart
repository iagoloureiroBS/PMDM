
class Profesor {
  String nome;
  String centro = "IES San Mamede";

  Profesor({required this.nome, this.centro = "Maceda"});

  Profesor.desconocido() : nome = "Descoñecido", centro = "Sen centro";

  void presentarse(){
    print("Son $nome, profesor/a no $centro.");
  }
}

class UtilidadesNotas{
  static double media(double primeira, double segunda) => (primeira + segunda) / 2;
}

class Alumno {
  int _nota = 0;
  int get nota => _nota;

  set nota(int valor){
    if(valor>= 0 && valor <= 10){
      _nota = valor;
    }
  }
}

class Persoa{
  String nome;

  Persoa({required this.nome});

  presentarse(){
    print("Hola, son $nome");
  }


  @override
  String toString(){
    return "Persoa - Nome: $nome";
  }

  static bool eSerVivo(){
    return true;
  }
}

  class Profesor2 extends Persoa{
    String centro;
    Profesor2({required super.nome, this.centro = ""});
    @override
    presentarse(){
      super.presentarse;
      print("Soy profesor en $centro");
    }
  }

  class Curso {
    String grupo;
    // List<Alumno> alumnos;
    // List<Profesor2> profesores;
    // Profesor titor;
    void Function() aoComenzar;
    Curso({required this.grupo, required this.aoComenzar});

    comezar(){
      print("Hola, soy Messi, encantado $grupo");
      aoComenzar();
    }
  }

  void avisar(){
    print("Benvidos a PMDM, 2ºDAM");
  }

void main() {
  var iago = Persoa(nome: "Iago");
  iago.presentarse();
  var toni = Profesor(nome: "Toni", centro: "IES San Mamada");
  toni.presentarse();
  print(Persoa.eSerVivo());
  var dam2 = Curso(grupo: "2ºDAM", aoComenzar: avisar);
  var dam3 = Curso(grupo: "B",aoComenzar: () => print("Pepero"));
  dam2.comezar();
  dam3.comezar();

  /*
  var vane = Profesor(nome: "Messi");
  var des = Profesor.desconocido();
  vane.nome = "Vane";
  des.presentarse();
  vane.presentarse();
  double resultado = 0.0;

  resultado = UtilidadesNotas.media(5.2, 6.3);
  print(resultado);
  */
}

