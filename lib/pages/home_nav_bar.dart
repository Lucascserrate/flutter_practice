// Este es un ejemplo de una screen que tiene una navegacion
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/contacts.dart';
import 'package:flutterapp/pages/gifs.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/nav_bar.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  int currentPage = 0;
  void updatePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  List<Widget> pages = [
    const Gifs(),
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
