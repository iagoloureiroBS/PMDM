
import 'package:flutter/material.dart';

class FilaYColumnas extends StatelessWidget {
  const FilaYColumnas({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fila superior con tres iconos
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school),
              SizedBox(width: 8),
              Icon(Icons.person),
              SizedBox(width: 8),
              Icon(Icons.book),
            ],
          ),

          const SizedBox(height: 16), // Separación vertical

          // Columna inferior con textos alineados a la izquierda
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Diego Rodicio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Profesor de PMDM'),
            ],
          ),
        ],
      ),
    );
  }
}
