
import 'package:flutter/material.dart';

void main() {
  // runApp() arranca la aplicación e infla el widget raíz en la pantalla.
  runApp(const Aplicacion());
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IES San Mamede',
      home: PantallaCentro(),
    );
  }
}

class PantallaCentro extends StatelessWidget {
  const PantallaCentro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IES San Mamede',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Diego Rodicio — Profesor de PMDM no IES San Mamede',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
