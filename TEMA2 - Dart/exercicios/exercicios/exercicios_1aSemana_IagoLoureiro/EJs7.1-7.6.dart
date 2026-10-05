void main() {
  // 7.1. Campos posicionais
  var usuario = ('Xurxo', 20);
  print(usuario.$1);
  print(usuario.$2);

  // 7.2. Campos nomeados
  var usuarioNomeado = (nome: 'Xurxo', idade: 20);
  print(usuarioNomeado.nome);
  print(usuarioNomeado.idade);

  // 7.3. Substituír un rexistro
  var rexistro = ('Ana', 22);
  rexistro = ('Luis', 28);
  print(rexistro);

  // 7.4. Comparar rexistros
  var rexistro1 = (x: 10, y: 20);
  var rexistro2 = (x: 10, y: 20);
  print(rexistro1 == rexistro2);

  // 7.5. Lista de rexistros
  List<(String, int)> listaUsuarios = [
    ('Xurxo', 20),
    ('Sabela', 24),
    ('Brais', 26)
  ];
  for (var u in listaUsuarios) {
    print(u);
  }

  // 7.6. Un rexistro dentro doutro
  var enderezo = (rua: 'Rúa Principal', numero: 5);
  var usuarioConEnderezo = (nome: 'Xurxo', idade: 20, enderezo: enderezo);
  print(usuarioConEnderezo);
}