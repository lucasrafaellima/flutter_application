import 'package:flutter/material.dart';
import 'main.dart'; // Importa o modelo Exercicio

class TelaDetalhesExercicio extends StatelessWidget {
  final Exercicio exercicio;

  const TelaDetalhesExercicio({super.key, required this.exercicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercicio.nome),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(exercicio.emoji, style: const TextStyle(fontSize: 100)),
            const SizedBox(height: 16),
            Text(
              exercicio.nome,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(exercicio.grupoMuscular),
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 12),
            Text(
              exercicio.series,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              exercicio.descricao,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${exercicio.nome} concluído! 💪')),
                  );
                },
                child: const Text('Marcar como Concluído', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}