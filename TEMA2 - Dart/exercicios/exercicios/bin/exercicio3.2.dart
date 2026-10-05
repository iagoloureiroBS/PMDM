void main(List<String> args) {
  int? idade = null; 
  final data = DateTime.now();

  print(idade == null ? "Sin idade" : "É par? ${idade.isEven}");
  

}