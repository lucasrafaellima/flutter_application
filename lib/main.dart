import 'package:flutter/material.dart';
import 'detalhes-exercicio.dart'; // Importa a tela de detalhes
import 'opcao-exercicios.dart';
void main() {
  runApp(const MeuAppAcademia());
}

class MeuAppAcademia extends StatelessWidget {
  const MeuAppAcademia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Treino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const TelaListaExercicios(),
    );
  }
}