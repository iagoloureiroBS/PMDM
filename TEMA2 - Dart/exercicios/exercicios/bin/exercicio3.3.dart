void main(List<String> args) {
  Object numero = 42;

  print(numero is int ? "¿Es par? ${numero.isEven}" : "ERROR");
  print((numero as int).isEven);
}