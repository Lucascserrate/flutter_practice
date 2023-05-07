import 'package:flutter/material.dart';
import 'package:flutterapp/pages/swiper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> images = [
    'https://pbs.twimg.com/media/FvWbxJbXgAIXv-q?format=jpg&name=small',
    'https://pbs.twimg.com/media/FvJ8YOkXgAIC8O_?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fu1Z7fVWcAIzUcm?format=jpg&name=small',
    'https://pbs.twimg.com/media/Furrs-eXoAAqolD?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fub7kDlXoAUMMum?format=jpg&name=small'
  ];
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SwiperComponent()));
  }
}
