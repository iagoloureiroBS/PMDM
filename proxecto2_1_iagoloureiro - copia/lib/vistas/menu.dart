import '../modelo/equipo.dart';
import '../modelo/futbolista.dart';
import '../modelo/jugador_campo.dart';
import '../modelo/portero.dart';
import '../modelo/repositorio_futbolistas.dart';
import 'lectores.dart';

// Mostrar el menu y pedir los datos.
class Menu {
  final RepositorioFutbolistas _repositorio;
  Menu({required RepositorioFutbolistas repositorio})
    : _repositorio = repositorio;

  // Ejecutar la opcion seleccionada.
  void iniciar() {
    int opcion = -1;
    try {
      while (opcion != 0) {
        mostrarMenu();
        opcion = Lectores.numero(
          'Selecciona una opcion: ',
          minimo: 0,
          maximo: 7,
        );
        switch (opcion) {
          case 1:
            int cantidad = _repositorio.cargarEjemplos();
            print('Ejemplos nuevos: $cantidad. Los existentes se conservan.');
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
            mostrarJugadores(_repositorio.obtenerTodos());
            break;
          case 6:
            buscarJugadores();
            break;
          case 7:
            ordenarJugadores();
            break;
          case 0:
            print('Programa finalizado.');
            break;
        }
      }
    } on StateError {
      print('Entrada cerrada. Programa finalizado.');
    }
  }

  // Mostrar el menu principal.
  void mostrarMenu() {
    print('\n========== GESTION DE FUTBOLISTAS ==========');
    print('1. Cargar jugadores de ejemplo');
    print('2. Añadir jugador');
    print('3. Modificar jugador');
    print('4. Eliminar jugador');
    print('5. Mostrar jugadores');
    print('6. Buscar jugadores');
    print('7. Ordenar jugadores');
    print('0. Salir');
  }

  // Mostrar jugadores con pausas cada tres.
  void mostrarJugadores(List<Futbolista> jugadores, {int tamanoGrupo = 3}) {
    if (jugadores.isEmpty) {
      print('No hay futbolistas para mostrar.');
      return;
    }
    for (int i = 0; i < jugadores.length; i++) {
      mostrarFicha(jugadores[i]);
      if ((i + 1) % tamanoGrupo == 0 && i + 1 < jugadores.length) {
        Lectores.linea('Pulsa Enter para continuar...');
      }
    }
  }

  // Mostrar la ficha de un jugador.
  void mostrarFicha(Futbolista elemento) {
    print(elemento.presentar());
  }

  // Escoger un jugador por codigo o cancelar con 0.
  Futbolista? seleccionarJugador() {
    List<Futbolista> jugadores = _repositorio.obtenerTodos();
    mostrarJugadores(jugadores);
    if (jugadores.isEmpty) return null;
    while (true) {
      int codigo = Lectores.numero(
        'Codigo (0 para cancelar): ',
        minimo: 0,
        maximo: 999999,
      );
      if (codigo == 0) {
        print('Seleccion cancelada.');
        return null;
      }
      Futbolista? jugador = _repositorio.buscarPorCodigo(codigo);
      if (jugador != null) return jugador;
      print('No existe un jugador con ese codigo.');
    }
  }

  // Pedir la posicion del jugador.
  PosicionCampo pedirPosicion({PosicionCampo? actual}) {
    for (int i = 0; i < PosicionCampo.values.length; i++) {
      print('${i + 1}. ${PosicionCampo.values[i].name.toUpperCase()}');
    }
    int? anterior;
    if (actual != null) anterior = actual.index + 1;
    int opcion = Lectores.numero(
      'Posicion: ',
      minimo: 1,
      maximo: PosicionCampo.values.length,
      actual: anterior,
    );
    return PosicionCampo.values[opcion - 1];
  }

  // Pedir los datos para añadir o modificar un jugador.
  Futbolista pedirDatos({required int codigo, Futbolista? actual}) {
    bool esPortero;
    if (actual == null) {
      int tipo = Lectores.numero(
        'Tipo: 1. Campo / 2. Portero: ',
        minimo: 1,
        maximo: 2,
      );
      esPortero = tipo == 2;
    } else {
      esPortero = actual is Portero;
      print('Enter conserva el dato anterior. El codigo y el tipo no cambian.');
      mostrarFicha(actual);
    }
    String nombre = Lectores.texto('Nombre: ', actual: actual?.nombre);
    int edad = Lectores.numero(
      'Edad (14-200): ',
      minimo: 14,
      maximo: 200,
      actual: actual?.edad,
    );
    String club = Lectores.texto('Club: ', actual: actual?.equipo.nombre);
    int media = Lectores.numero(
      'Media (1-99): ',
      minimo: 1,
      maximo: 99,
      actual: actual?.media,
    );
    int potencial = Lectores.numero(
      'Potencial (1-99): ',
      minimo: 1,
      maximo: 99,
      actual: actual?.potencial,
    );
    Equipo equipo = Equipo(nombre: club);
    if (esPortero) {
      int? anteriores;
      if (actual is Portero) anteriores = actual.paradas;
      int paradas = Lectores.numero(
        'Paradas (0-9999): ',
        minimo: 0,
        maximo: 9999,
        actual: anteriores,
      );
      return Portero(
        codigo: codigo,
        nombre: nombre,
        edad: edad,
        equipo: equipo,
        media: media,
        potencial: potencial,
        paradas: paradas,
      );
    }
    PosicionCampo? anterior;
    int? golesAnteriores;
    if (actual is JugadorCampo) {
      anterior = actual.posicionCampo;
      golesAnteriores = actual.goles;
    }
    PosicionCampo posicion = pedirPosicion(actual: anterior);
    int goles = Lectores.numero(
      'Goles (0-9999): ',
      minimo: 0,
      maximo: 9999,
      actual: golesAnteriores,
    );
    return JugadorCampo(
      codigo: codigo,
      nombre: nombre,
      edad: edad,
      equipo: equipo,
      media: media,
      potencial: potencial,
      posicionCampo: posicion,
      goles: goles,
    );
  }

  // Añadir un jugador sin repetir su codigo.
  void anadirJugador() {
    while (true) {
      int codigo = Lectores.numero(
        'Codigo nuevo (0 para cancelar; ejemplos usan 1-10): ',
        minimo: 0,
        maximo: 999999,
      );
      if (codigo == 0) return;
      if (_repositorio.buscarPorCodigo(codigo) != null) {
        print('Ese codigo ya existe.');
        continue;
      }
      Futbolista nuevo = pedirDatos(codigo: codigo);
      if (_repositorio.anadir(nuevo)) {
        print('Jugador añadido correctamente.');
      } else {
        print('Codigo duplicado.');
      }
      return;
    }
  }

  // Modificar un jugador permitiendo mantener valores.
  void modificarJugador() {
    Futbolista? jugador = seleccionarJugador();
    if (jugador == null) return;
    Futbolista nuevo = pedirDatos(codigo: jugador.codigo, actual: jugador);
    if (_repositorio.modificar(nuevo)) {
      print('Jugador modificado correctamente.');
    } else {
      print('Jugador no encontrado.');
    }
  }

  // Eliminar un jugador pidiendo confirmacion.
  void eliminarJugador() {
    Futbolista? jugador = seleccionarJugador();
    if (jugador == null) return;
    if (!Lectores.confirmar('¿Eliminar a ${jugador.nombre}?')) {
      print('Eliminacion cancelada.');
      return;
    }
    if (_repositorio.eliminar(jugador.codigo)) {
      print('Jugador eliminado correctamente.');
    } else {
      print('Jugador no encontrado.');
    }
  }

  // Buscar por nombre, club o posicion.
  void buscarJugadores() {
    String texto = Lectores.linea(
      'Nombre, club o posicion (Enter para cancelar): ',
    );
    if (texto.isEmpty) return;
    List<Futbolista> resultados = _repositorio.buscar(texto);
    if (resultados.isEmpty) {
      print('No se encontraron jugadores.');
      return;
    }
    mostrarJugadores(resultados);
  }

  // Ordenar por media o potencial.
  void ordenarJugadores() {
    int opcion = Lectores.numero(
      '1. Media / 2. Potencial / 0. Cancelar: ',
      minimo: 0,
      maximo: 2,
    );
    if (opcion == 0) return;
    mostrarJugadores(_repositorio.ordenar(porPotencial: opcion == 2));
  }
}
