import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String texto;
  const Homepage(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/terms'),
            child: Text(texto)),
      ),
    );
  }
}
