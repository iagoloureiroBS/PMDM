import 'equipo.dart';
import 'futbolista.dart';
import 'jugador_campo.dart';
import 'portero.dart';

// Guardar y gestionar la lista de futbolistas.
class RepositorioFutbolistas {
  final List<Futbolista> _jugadores = [];

  List<Futbolista> obtenerTodos() => List<Futbolista>.from(_jugadores);

  // Buscar un jugador por codigo.
  Futbolista? buscarPorCodigo(int codigo) {
    for (Futbolista jugador in _jugadores) {
      if (jugador.codigo == codigo) return jugador;
    }
    return null;
  }

  // Añadir un jugador si su codigo no existe.
  bool anadir(Futbolista jugador) {
    if (buscarPorCodigo(jugador.codigo) != null) return false;
    _jugadores.add(jugador);
    return true;
  }

  // Añadir varios jugadores sin repetir los codigos.
  int anadirVarios(List<Futbolista> nuevos) {
    List<int> codigos = [];
    for (Futbolista jugador in _jugadores) {
      codigos.add(jugador.codigo);
    }
    List<Futbolista> pendientes = [];
    for (Futbolista jugador in nuevos) {
      if (!codigos.contains(jugador.codigo)) {
        pendientes.add(jugador);
        codigos.add(jugador.codigo);
      }
    }
    _jugadores.addAll(pendientes);
    return pendientes.length;
  }

  // Guardar los datos del modificado.
  bool modificar(Futbolista nuevo) {
    for (int i = 0; i < _jugadores.length; i++) {
      if (_jugadores[i].codigo == nuevo.codigo) {
        _jugadores[i] = nuevo;
        return true;
      }
    }
    return false;
  }

  // Eliminar un jugador por codigo.
  bool eliminar(int codigo) {
    Futbolista? jugador = buscarPorCodigo(codigo);
    if (jugador == null) return false;
    return _jugadores.remove(jugador);
  }

  // Filtrar con callback.
  List<Futbolista> filtrar({required bool Function(Futbolista) criterio}) {
    return _jugadores.where(criterio).toList();
  }

  // Buscar por nombre, club o posicion.
  List<Futbolista> buscar(String texto) {
    String busqueda = texto.trim().toLowerCase();
    return filtrar(
      criterio: (jugador) {
        return jugador.nombre.toLowerCase().contains(busqueda) ||
            jugador.equipo.nombre.toLowerCase().contains(busqueda) ||
            jugador.posicion.toLowerCase().contains(busqueda);
      },
    );
  }

  // Ordenar por media o potencial.
  List<Futbolista> ordenar({bool porPotencial = false}) {
    List<Futbolista> resultado = obtenerTodos();
    resultado.sort((a, b) {
      if (porPotencial) return b.potencial.compareTo(a.potencial);
      return b.media.compareTo(a.media);
    });
    return resultado;
  }

  // Cargar ejemplos.
  int cargarEjemplos() {
    Equipo barcelona = Equipo(nombre: 'Barcelona');
    Equipo retirado = Equipo(nombre: 'Retirado');
    List<Futbolista> ejemplos = [
      JugadorCampo(
        codigo: 1,
        nombre: 'Messi',
        edad: 39,
        equipo: Equipo(nombre: 'Inter Miami'),
        posicionCampo: PosicionCampo.dc,
        media: 90,
        potencial: 99,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 2,
        nombre: 'Lamine Yamal',
        edad: 19,
        equipo: barcelona,
        posicionCampo: PosicionCampo.ed,
        media: 94,
        potencial: 99,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 3,
        nombre: 'Pedri',
        edad: 23,
        equipo: barcelona,
        posicionCampo: PosicionCampo.mc,
        media: 92,
        potencial: 97,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 4,
        nombre: 'Cubarsi',
        edad: 19,
        equipo: barcelona,
        posicionCampo: PosicionCampo.dfc,
        media: 87,
        potencial: 98,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 5,
        nombre: 'Ronaldinho',
        edad: 46,
        equipo: retirado,
        posicionCampo: PosicionCampo.mco,
        media: 91,
        potencial: 96,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 6,
        nombre: 'Raphinha',
        edad: 29,
        equipo: barcelona,
        posicionCampo: PosicionCampo.ei,
        media: 89,
        potencial: 94,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 7,
        nombre: 'Zidane',
        edad: 54,
        equipo: retirado,
        posicionCampo: PosicionCampo.mco,
        media: 91,
        potencial: 93,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 8,
        nombre: 'Iniesta',
        edad: 42,
        equipo: retirado,
        posicionCampo: PosicionCampo.mc,
        media: 92,
        potencial: 94,
        goles: 0,
      ),
      JugadorCampo(
        codigo: 9,
        nombre: 'Xavi Hernandez',
        edad: 46,
        equipo: retirado,
        posicionCampo: PosicionCampo.mc,
        media: 92,
        potencial: 94,
        goles: 0,
      ),
      Portero(
        codigo: 10,
        nombre: 'Ter Stegen',
        edad: 34,
        equipo: barcelona,
        media: 89,
        potencial: 93,
        paradas: 0,
      ),
    ];
    return anadirVarios(ejemplos);
  }
}
