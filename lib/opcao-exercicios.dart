import 'package:flutter/material.dart';
import 'main.dart';
import 'detalhes-exercicio.dart'; // Importa a tela de detalhes
// Modelo de dados para os exercícios
class Exercicio {
  final String nome;
  final String grupoMuscular;
  final String series;
  final String emoji;
  final String descricao;

  Exercicio({
    required this.nome,
    required this.grupoMuscular,
    required this.series,
    required this.emoji,
    required this.descricao,
  });
}

class TelaListaExercicios extends StatelessWidget {
  const TelaListaExercicios({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Exercicio> listaExercicios = [
      Exercicio(
        nome: 'Supino Reto',
        grupoMuscular: 'Peitoral',
        series: '4 séries x 10 a 12 repetições',
        emoji: '🏋️‍♂️',
        descricao: 'Deite no banco plano, segure a barra na largura dos ombros e desça até o peito com controle.',
      ),
      Exercicio(
        nome: 'Agachamento Livre',
        grupoMuscular: 'Pernas / Glúteos',
        series: '4 séries x 10 repetições',
        emoji: '🦵',
        descricao: 'Posicione a barra sobre os trapézios, agache mantendo a coluna ereta até o ângulo de 90 graus.',
      ),
      Exercicio(
        nome: 'Puxada Frontal',
        grupoMuscular: 'Costas',
        series: '3 séries x 12 repetições',
        emoji: '💪',
        descricao: 'Sente-se no aparelho, puxe a barra em direção ao peito contraindo bem a musculatura das costas.',
      ),
      Exercicio(
        nome: 'Corrida na Esteira',
        grupoMuscular: 'Cardio',
        series: '20 minutos em ritmo moderado',
        emoji: '🏃‍♂️',
        descricao: 'Mantenha a postura ereta e o ritmo constante para trabalhar a resistência cardiorrespiratória.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Treino do Dia'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: listaExercicios.length,
        itemBuilder: (context, index) {
          final exercicio = listaExercicios[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Text(exercicio.emoji, style: const TextStyle(fontSize: 32)),
              title: Text(
                exercicio.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${exercicio.grupoMuscular} • ${exercicio.series}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDetalhesExercicio(exercicio: exercicio),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}