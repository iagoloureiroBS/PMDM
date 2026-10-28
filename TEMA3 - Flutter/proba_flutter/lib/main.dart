import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App de exemplo - 2º DAM",
      home: PantallaPrincipal()
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar - Pantalla principal")
      ),
        body: Text("A miña primeira app en Flutter iuahfiusahfiuhaiushfiusdhfuidahfiudsfdhaiudhfdiushopfhdaiopfphuappiahdfuipdahfudishfihuaouadsoiuafhdiufhdjushfuidshfuisdhfuieshfdiushfiuehs", 
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 0, 0),
        letterSpacing: 10,
        decoration: TextDecoration.lineThrough,
        height: 10)
      )
    );
  }
}