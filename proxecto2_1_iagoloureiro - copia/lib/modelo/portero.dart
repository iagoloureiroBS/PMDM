import 'equipo.dart';
import 'futbolista.dart';
import 'validaciones.dart';

// Constructor Portero con sus paradas y posicion.
class Portero extends Futbolista {
  int _paradas;
  Portero({
    required int codigo,
    required String nombre,
    required int edad,
    required Equipo equipo,
    required int media,
    required int potencial,
    required int paradas,
  }) : _paradas = Validaciones.numero(paradas, minimo: 0, maximo: 9999),
       super(
         codigo: codigo,
         nombre: nombre,
         edad: edad,
         equipo: equipo,
         media: media,
         potencial: potencial,
       );
  int get paradas => _paradas;
  set paradas(int valor) =>
      _paradas = Validaciones.numero(valor, minimo: 0, maximo: 9999);
  @override
  String get posicion => 'POR';
  @override
  String detalle() => 'Portero | Paradas: $paradas';
}
