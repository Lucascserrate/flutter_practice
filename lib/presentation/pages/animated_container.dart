import 'dart:math'; // es como el Math.random de JS

import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  void changeContainer() {
    final random = Random();
    setState(() {
      _width = (random.nextInt(300) + 30).toDouble();
      _height = (random.nextInt(300) + 30).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius =
          BorderRadius.circular((random.nextInt(12) + 8).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nada',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedContainer'),
          backgroundColor: _color,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: _borderRadius,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: changeContainer,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_color),
              ),
              child: const Text('Change'),
            )
          ],
        ),
      ),
    );
  }
}
