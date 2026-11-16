
import 'package:flutter/material.dart';

class EjercicioMargenRelleno extends StatelessWidget {
  const EjercicioMargenRelleno({super.key});

  @override
  Widget build(BuildContext context) {
    // La diferencia radica en que 'margin' separa el Container por fuera de otros widgets,
    // mientras que 'padding' empuja el contenido interno (el Text) hacia dentro del Container.
    return Center(
      child: Container(
        width: 240,
        height: 120,
        margin: const EdgeInsets.all(12), // Margen exterior
        padding: const EdgeInsets.all(16), // Relleno interior
        color: Colors.blue.shade100,
        child: const Text('Diego Rodicio'),
      ),
    );
  }
}
