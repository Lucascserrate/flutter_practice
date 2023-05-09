import 'package:flutter/material.dart';

class Stateful extends StatefulWidget {
  final String text;
  const Stateful(this.text, {super.key});

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful'),
        backgroundColor: const Color.fromARGB(225, 0, 6, 8),
      ),
      body: Center(child: Text(widget.text)),
    );
  }
}
