import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Es basicamente un local storage
class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  int value = 0;

  void add() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ++value;
    });
    await prefs.setInt('value', value);
  }

  void reducing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      --value;
      prefs.setInt('value', value);
    });
  }

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt('value') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: reducing,
              child: const Text(
                '-',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
          Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          TextButton(
              onPressed: add,
              child: const Text(
                '+',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
        ],
      ),
    );
  }
}
