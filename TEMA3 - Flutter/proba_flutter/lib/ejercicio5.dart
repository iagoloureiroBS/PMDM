
import 'package:flutter/material.dart';

void main() => runApp(const PanelCentroApp());

class PanelCentroApp extends StatelessWidget {
  const PanelCentroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panel do Centro',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const PantallaPanel(),
    );
  }
}

class PantallaPanel extends StatelessWidget {
  const PantallaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IES San Mamede'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profesorado',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  TarjetaProfesor(
                    nome: 'Diego Rodicio',
                    materia: 'PMDM',
                  ),
                  SizedBox(height: 12),
                  TarjetaProfesor(
                    nome: 'Julia',
                    materia: 'Acceso a Datos',
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () => print('2º DAM'),
              child: const Text('Consultar grupo'),
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaProfesor extends StatelessWidget {
  final String nome;
  final String materia;

  const TarjetaProfesor({
    super.key,
    required this.nome,
    required this.materia,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.school),
        title: Text(nome),
        subtitle: Text(materia),
      ),
    );
  }
}
