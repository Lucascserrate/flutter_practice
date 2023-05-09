import 'package:flutter/material.dart';

class Stateless extends StatelessWidget {
  final String text;
  const Stateless(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless'),
        backgroundColor: Colors.black87,
      ),
      body: Center(child: Text(text)),
    );
  }
}
