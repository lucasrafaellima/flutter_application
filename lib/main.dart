import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Três Botões')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botão 1
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Clicou no Botão 1!')),
                  );
                },
                child: const Text('Botão 1'),
              ),

              const SizedBox(height: 20), // Espaçamento

              // Botão 2
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Clicou no Botão 2!')),
                  );
                },
                child: const Text('Botão 2 (Perigo)'),
              ),

              const SizedBox(height: 20), // Espaçamento

              OutlinedButton(
                onPressed: () {
                  print('Borda clicada!');
                },
                child: const Text('Detalhes'),
              )

            ],
          ),
        ),
      ),
    );
  }
}