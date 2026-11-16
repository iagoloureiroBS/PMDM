
import 'package:flutter/material.dart';

void main() => runApp(const AppLista());

class AppLista extends StatelessWidget {
  const AppLista({super.key});

  @override
  Widget build(BuildContext context) {
    final alumnos = [
      'Xurxo',
      'Roi',
      'Iria',
      'Anxo',
      'Adrián',
      'Iago',
      'Sergio',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IES San Mamede'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Alumnado de 2º DAM',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Expanded evita el error de altura infinita dentro de la Column
            Expanded(
              child: ListView.builder(
                itemCount: alumnos.length,

                // itemBuilder recibe el BuildContext y el índice entero del elemento actual,
                // y devuelve el widget que se va a pintar en esa posición específica de la lista.
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(alumnos[index]),
                    subtitle: const Text('2º DAM'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
