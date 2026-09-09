import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppComidas());
}

class MeuAppComidas extends StatelessWidget {
  const MeuAppComidas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Alimentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TelaListaAlimentos(),
    );
  }
}

// 1. Modelo de dados para estruturar as informações de cada alimento
class Alimento {
  final String nome;
  final String preco;
  final String emoji;
  final String descricao;

  Alimento({
    required this.nome,
    required this.preco,
    required this.emoji,
    required this.descricao,
  });
}

// 2. Tela Principal: Lista de Alimentos
class TelaListaAlimentos extends StatelessWidget {
  const TelaListaAlimentos({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados fictícios do cardápio
    final List<Alimento> listaAlimentos = [
      Alimento(
        nome: 'Hambúrguer Artesanal',
        preco: 'R\$ 28,00',
        emoji: '🍔',
        descricao: 'Pão brioche, 180g de carne bovina, queijo cheddar e molho da casa.',
      ),
      Alimento(
        nome: 'Pizza Pepperoni',
        preco: 'R\$ 45,00',
        emoji: '🍕',
        descricao: 'Massa artesanal com molho de tomate, mussarela e fatias de pepperoni.',
      ),
      Alimento(
        nome: 'Combo de Sushi',
        preco: 'R\$ 60,00',
        emoji: '🍣',
        descricao: '12 peças variadas incluindo hots, niguiris e uramakis frescos.',
      ),
      Alimento(
        nome: 'Salada Caesar',
        preco: 'R\$ 22,00',
        emoji: '🥗',
        descricao: 'Alface americana, tiras de frango grelhado, croutons e molho caesar.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: listaAlimentos.length,
        itemBuilder: (context, index) {
          final alimento = listaAlimentos[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Text(alimento.emoji, style: const TextStyle(fontSize: 32)),
              title: Text(
                alimento.nome, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                alimento.preco, 
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navegação para a Tela de Detalhes enviando o alimento selecionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDetalhesAlimento(alimento: alimento),
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

// 3. Tela de Detalhes do Alimento Selecionado
class TelaDetalhesAlimento extends StatelessWidget {
  final Alimento alimento;

  const TelaDetalhesAlimento({super.key, required this.alimento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(alimento.nome),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(alimento.emoji, style: const TextStyle(fontSize: 100)),
            const SizedBox(height: 16),
            Text(
              alimento.nome,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              alimento.preco,
              style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              alimento.descricao,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${alimento.nome} adicionado ao pedido!')),
                  );
                },
                child: const Text('Adicionar ao Pedido', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}