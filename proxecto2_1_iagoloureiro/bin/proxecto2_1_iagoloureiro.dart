
// PROXECTO TEMA 2.1 Iago Loureiro Carcacía

import "dart:io";

// Guardamos los jugadores en una lista de registros
List<({
  String nombre,
  int edad,
  String club,
  String posicion,
  int media,
  int potencial
})> jugadores = [];

//Cargar jugadores de ejemplo.
void cargarEjemplos() {
  if (jugadores.isNotEmpty) {
    print("Ya hay jugadores cargados.");
    return;
  }

  jugadores.addAll([
    (nombre: "Messi", edad: 39, club: "Inter Miami", posicion: "DC", media: 90, potencial: 99),
    (nombre: "Lamine Yamal", edad: 19, club: "Barcelona", posicion: "ED", media: 94, potencial: 99),
    (nombre: "Pedri", edad: 23, club: "Barcelona", posicion: "MC", media: 92, potencial: 97),
    (nombre: "Cubarsi", edad: 19, club: "Barcelona", posicion: "DFC", media: 87, potencial: 98),
    (nombre: "Ronaldinho", edad: 46, club: "Retirado", posicion: "MCO", media: 91, potencial: 96),
    (nombre: "Raphinha", edad: 29, club: "Barcelona", posicion: "EI", media: 89, potencial: 94),
    (nombre: "Zidane", edad: 54, club: "Retirado", posicion: "MCO", media: 91, potencial: 93),
    (nombre: "Iniesta", edad: 42, club: "Retirado", posicion: "MC", media: 92, potencial: 94),
    (nombre: "Xavi Hernandez", edad: 46, club: "Retirado", posicion: "MC", media: 92, potencial: 94),
    (nombre: "Busquets", edad: 38, club: "Retirado", posicion: "MCD", media: 89, potencial: 93)
  ]);

  print("Jugadores cargados correctamente.");
}


//Añadir un jugador

void anadirJugador() {
  print("\n--- AÑADIR JUGADOR ---");

  stdout.write("Nombre: ");
  String nombre = stdin.readLineSync() ?? "";

  stdout.write("Edad: ");
  int? edad = int.tryParse(stdin.readLineSync() ?? "");

  stdout.write("Club: ");
  String club = stdin.readLineSync() ?? "";

  stdout.write("Posicion: ");
  String posicion = stdin.readLineSync() ?? "";

  stdout.write("Media: ");
  int? media = int.tryParse(stdin.readLineSync() ?? "");

  stdout.write("Potencial: ");
  int? potencial = int.tryParse(stdin.readLineSync() ?? "");

  if (nombre.trim().isEmpty || club.trim().isEmpty || posicion.trim().isEmpty ||
      edad == null || media == null || potencial == null) {
    print("Error: faltan datos o alguno no es valido.");
    return;
  }

  if (edad < 14 || edad > 200 || media < 1 || media > 99 ||
      potencial < 1 || potencial > 99) {
    print("Error: los valores estan fuera de rango.");
    return;
  }

  jugadores.add((
    nombre: nombre,
    edad: edad,
    club: club,
    posicion: posicion,
    media: media,
    potencial: potencial
  ));

  print("Jugador añadido correctamente.");
}

// Mostrar lista completa de jugadores
void mostrarJugadores() {
  if (jugadores.isEmpty) {
    print("No hay jugadores registrados.");
    return;
  }

  print("\n--- LISTA DE JUGADORES ---");

  for (int i = 0; i < jugadores.length; i++) {
    var jugador = jugadores[i];

    var (:nombre, :edad, :club, :posicion, :media, :potencial) = jugador;

    print("\n${i + 1}. $nombre");
    print("Edad: $edad");
    print("Club: $club");
    print("Posicion: $posicion");
    print("Media: $media");
    print("Potencial: $potencial");
  }
}

// Modificar jugador permitiendo mantener valores
void modificarJugador() {
  if (jugadores.isEmpty) {
    print("No hay jugadores registrados.");
    return;
  }

  mostrarJugadores();

  stdout.write("\nNumero del jugador a modificar: ");
  int? numero = int.tryParse(stdin.readLineSync() ?? "");

  if (numero == null || numero < 1 || numero > jugadores.length) {
    print("Jugador no valido.");
    return;
  }

  var jugador = jugadores[numero - 1];

  print("\nDeja un campo vacio para mantener el dato anterior.");

  stdout.write("Nombre (${jugador.nombre}): ");
  String nombre = stdin.readLineSync() ?? "";
  if (nombre.trim().isEmpty) {
    nombre = jugador.nombre;
  }

  stdout.write("Edad (${jugador.edad}): ");
  String textoEdad = stdin.readLineSync() ?? "";
  int edad = jugador.edad;
  if (textoEdad.trim().isNotEmpty) {
    int? nuevaEdad = int.tryParse(textoEdad);
    if (nuevaEdad == null || nuevaEdad < 15 || nuevaEdad > 200) {
      print("Edad no valida.");
      return;
    }
    edad = nuevaEdad;
  }

  stdout.write("Club (${jugador.club}): ");
  String club = stdin.readLineSync() ?? "";
  if (club.trim().isEmpty) {
    club = jugador.club;
  }

  stdout.write("Posicion (${jugador.posicion}): ");
  String posicion = stdin.readLineSync() ?? "";
  if (posicion.trim().isEmpty) {
    posicion = jugador.posicion;
  }

  stdout.write("Media (${jugador.media}): ");
  String textoMedia = stdin.readLineSync() ?? "";
  int media = jugador.media;
  if (textoMedia.trim().isNotEmpty) {
    int? nuevaMedia = int.tryParse(textoMedia);
    if (nuevaMedia == null || nuevaMedia < 1 || nuevaMedia > 99) {
      print("Media no valida.");
      return;
    }
    media = nuevaMedia;
  }

  stdout.write("Potencial (${jugador.potencial}): ");
  String textoPotencial = stdin.readLineSync() ?? "";
  int potencial = jugador.potencial;
  if (textoPotencial.trim().isNotEmpty) {
    int? nuevoPotencial = int.tryParse(textoPotencial);
    if (nuevoPotencial == null || nuevoPotencial < 1 || nuevoPotencial > 99) {
      print("Potencial no valido.");
      return;
    }
    potencial = nuevoPotencial;
  }

  jugadores[numero - 1] = (
    nombre: nombre.trim(),
    edad: edad,
    club: club.trim(),
    posicion: posicion.trim(),
    media: media,
    potencial: potencial
  );

  print("Jugador modificado correctamente.");
}


// Eliminar jugador por numero
void eliminarJugador() {
  if (jugadores.isEmpty) {
    print("No hay jugadores registrados.");
    return;
  }

  mostrarJugadores();

  stdout.write("\nNumero del jugador a eliminar: ");
  int? numero = int.tryParse(stdin.readLineSync() ?? "");

  if (numero == null || numero < 1 || numero > jugadores.length) {
    print("Jugador no valido.");
    return;
  }

  var jugador = jugadores[numero - 1];
  jugadores.remove(jugador);

  print("Jugador eliminado correctamente.");
}


// Buscar jugador por Nombre, Club o Posición
void buscarJugadores() {
  if (jugadores.isEmpty) {
    print("No hay jugadores registrados.");
    return;
  }

  stdout.write("Introduce el nombre, club o posicion: ");
  String busqueda = (stdin.readLineSync() ?? "").trim().toLowerCase();

  if (busqueda.isEmpty) {
    print("No has introducido nada.");
    return;
  }

  var resultados = jugadores.where((jugador) {
    return jugador.nombre.toLowerCase().contains(busqueda) ||
        jugador.club.toLowerCase().contains(busqueda) ||
        jugador.posicion.toLowerCase().contains(busqueda);
  }).toList();

  if (resultados.isEmpty) {
    print("No se encontraron jugadores.");
  } else {
    print("\n--- RESULTADOS ---");

    for (var jugador in resultados) {
      print("${jugador.nombre} - ${jugador.club} - ${jugador.posicion}");
      print("Edad: ${jugador.edad} | Media: ${jugador.media} | Potencial: ${jugador.potencial}\n");
    }
  }
}


// Ordenar jugadores
void ordenarJugadores({bool porPotencial = false}) {
  if (jugadores.isEmpty) {
    print("No hay jugadores registrados.");
    return;
  }

  if (porPotencial) {
    jugadores.sort((a, b) => b.potencial.compareTo(a.potencial));
  } else {
    jugadores.sort((a, b) => b.media.compareTo(a.media));
  }

  mostrarJugadores();
}

void mostrarMenu() {
  print("\n========== GESTION DE FUTBOLISTAS ==========");
  print("1. Cargar jugadores de ejemplo");
  print("2. Añadir jugador");
  print("3. Modificar jugador");
  print("4. Eliminar jugador");
  print("5. Mostrar jugadores");
  print("6. Buscar jugadores");
  print("7. Ordenar jugadores");
  print("0. Salir");
  print("============================================");
}

void main() {
  int opcion = -1;

  while (opcion != 0) {
    mostrarMenu();

    stdout.write("Selecciona una opcion: ");
    int? entrada = int.tryParse(stdin.readLineSync() ?? "");

    if (entrada == null) {
      print("Introduce un numero valido.");
      continue;
    }

    opcion = entrada;

    switch (opcion) {
      case 1:
        cargarEjemplos();
        break;
      case 2:
        anadirJugador();
        break;
      case 3:
        modificarJugador();
        break;
      case 4:
        eliminarJugador();
        break;
      case 5:
        mostrarJugadores();
        break;
      case 6:
        buscarJugadores();
        break;
      case 7:
        print("1. Ordenar por media");
        print("2. Ordenar por potencial");

        stdout.write("Opcion: ");
        int? orden = int.tryParse(stdin.readLineSync() ?? "");

        if (orden == 1) {
          ordenarJugadores();
        } else if (orden == 2) {
          ordenarJugadores(porPotencial: true);
        } else {
          print("Opcion no valida.");
        }
  break;
      case 0:
        print("Programa finalizado.");
        break;
      default:
        print("Opcion no valida.");
    }
  }
}


