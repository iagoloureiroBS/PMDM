import 'validaciones.dart';

// Guardar el nombre del equipo.
class Equipo {
  final String _nombre;
  Equipo({required String nombre}) : _nombre = Validaciones.texto(nombre);
  String get nombre => _nombre;
  @override
  String toString() => nombre;
}
