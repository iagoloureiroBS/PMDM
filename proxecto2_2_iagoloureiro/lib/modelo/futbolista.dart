import 'equipo.dart';
import 'validaciones.dart';

// Datos comunes de los futbolistas.
abstract class Futbolista{
  final int _codigo;
  String _nombre;
  int _edad;
  Equipo _equipo;
  int _media;
  int _potencial;

  //Constructor jugador. 
  Futbolista({
    required int codigo,
    required String nombre,
    required int edad,
    required Equipo equipo,
    required int media,
    required int potencial,
  }) : _codigo = Validaciones.numero(codigo, minimo: 1, maximo: 9999),
       _nombre = Validaciones.texto(nombre),
       _edad = Validaciones.numero(edad, minimo: 14, maximo: 200),
       _equipo = equipo,
       _media = Validaciones.numero(media, minimo: 1, maximo: 99),
       _potencial = Validaciones.numero(potencial, minimo: 1, maximo: 99);

  // Getters y Setters.
  int get codigo => _codigo;
  String get nombre => _nombre;
  int get edad => _edad;
  Equipo get equipo => _equipo;
  int get media => _media;
  int get potencial => _potencial;
  set nombre(String valor) => _nombre = Validaciones.texto(valor);
  set edad(int valor) =>
      _edad = Validaciones.numero(valor, minimo: 14, maximo: 200);
  set equipo(Equipo valor) => _equipo = valor;
  set media(int valor) =>
      _media = Validaciones.numero(valor, minimo: 1, maximo: 99);
  set potencial(int valor) =>
      _potencial = Validaciones.numero(valor, minimo: 1, maximo: 99);

  // La posicion y el detalle dependen del tipo de jugador.
  // El detalle son goles para jugadores de campo y paradas para porteros.
  String get posicion;
  String detalle();

  // Mostrar los datos comunes y el detalle de cada uno.
  String presentar() => '${toString()} | ${detalle()}';
  @override
  String toString() =>
      '[$codigo] $nombre | Edad: $edad | Club: ${equipo.nombre} '
      '| Posicion: $posicion | Media: $media | Potencial: $potencial';
}
