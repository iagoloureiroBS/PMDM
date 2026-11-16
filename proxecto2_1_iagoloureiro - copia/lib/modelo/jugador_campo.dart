import 'equipo.dart';
import 'futbolista.dart';
import 'validaciones.dart';

// Posiciones de los jugadores de campo.
enum PosicionCampo { dc, ed, ei, mc, mco, mcd, dfc, ld, li }

// Constructor Jugador de campo con posicion y goles.
class JugadorCampo extends Futbolista {
  PosicionCampo _posicionCampo;
  int _goles;
  JugadorCampo({
    required int codigo,
    required String nombre,
    required int edad,
    required Equipo equipo,
    required int media,
    required int potencial,
    required PosicionCampo posicionCampo,
    required int goles,
  }) : _posicionCampo = posicionCampo,
       _goles = Validaciones.numero(goles, minimo: 0, maximo: 9999),
       super(
         codigo: codigo,
         nombre: nombre,
         edad: edad,
         equipo: equipo,
         media: media,
         potencial: potencial,
       );
  PosicionCampo get posicionCampo => _posicionCampo;
  int get goles => _goles;
  set posicionCampo(PosicionCampo valor) => _posicionCampo = valor;
  set goles(int valor) =>
      _goles = Validaciones.numero(valor, minimo: 0, maximo: 9999);
  @override
  String get posicion => _posicionCampo.name.toUpperCase();
  @override
  String detalle() => 'Jugador de campo | Goles: $goles';
}
