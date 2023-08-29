import 'package:flutter/material.dart';
import 'package:flutterapp/presentation/pages/homepage.dart';
import 'package:flutterapp/presentation/pages/terms.dart';
import 'package:flutterapp/presentation/pages/timer.dart';
import 'package:flutterapp/providers/countdown_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    String texto = 'Hola, soy un estado de main';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => CountdownProvider())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'string',
        initialRoute: '/',
        routes: {
          '/': (context) => const Timer(),
          '/terms': (context) => Terms(texto),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => Homepage(texto));
        },
      ),
    );
  }
}
