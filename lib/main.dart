import 'package:flutter/material.dart';
import 'package:flutterapp/pages/nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App'),
          ),
          body: const Center(child: Text('Hola')),
          bottomNavigationBar: const NavBar()),
    );
  }
}
