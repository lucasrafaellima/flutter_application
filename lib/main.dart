import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MinhaTela(),
    );
  }
}

// 1. Mudamos para StatefulWidget para que a tela consiga guardar estado (memória)
class MinhaTela extends StatefulWidget {
  const MinhaTela({super.key});

  @override
  State<MinhaTela> createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  // 2. Variável de controle: começa como falsa (botão escondido)
  bool _mostrarTerceiroBotao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo Botão Dinâmico')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão 1
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Clicou no Botão 1')),
                );
              },
              child: const Text('Botão 1'),
            ),

            const SizedBox(height: 20),

            // Botão 2 (Perigo)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // 3. Atualiza o estado da tela
                setState(() {
                  _mostrarTerceiroBotao = true; // Altera para true
                });
              },
              child: const Text('Botão 2 (Perigo)'),
            ),

            // 4. Renderização condicional: Só desenha na tela se _mostrarTerceiroBotao for true
            if (_mostrarTerceiroBotao) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Você encontrou o Botão 3!')),
                  );
                },
                child: const Text('Botão 3 (Surpresa!)'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}