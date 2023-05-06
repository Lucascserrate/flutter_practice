import 'package:flutter/material.dart';
import 'package:flutterapp/pages/contacts.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  void updatePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  List<Widget> pages = [
    const Home(),
    const Contacts(),
    const Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Page'),
          ),
          body: pages[currentPage],
          bottomNavigationBar: NavBar(updatePage: updatePage)),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }
}
