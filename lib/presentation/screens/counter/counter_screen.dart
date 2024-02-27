import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = 'CounterScreen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Text(
          'Valor: 0',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Incrementar el contador
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
