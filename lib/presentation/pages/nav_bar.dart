import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final Function(int)
      updatePage; //indica que es una funcion que recibe un argumento de tipo int
  // const NavBar({Key? key, required this.updatePage}) : super(key: key);
  const NavBar({super.key, required this.updatePage}); // Esta la veo mas limpia

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() => currentPage = index);
          widget.updatePage(index);
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
        ]);
  }
}
