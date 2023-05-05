import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});
  @override
  AlertState createState() => AlertState();
}

class AlertState extends State<Alert> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
        backgroundColor: const Color(0xff001230),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff001230))),
              onPressed: () {
                showDialog(
                    barrierDismissible:
                        false, //Para que no cierre al tocar afuera del pop up
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Esta es una alerta"),
                          content: const Text("Contenido de la alerta"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    state = true;
                                  });
                                },
                                child: const Text('Si')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    state = false;
                                  });
                                },
                                child: const Text('No')),
                          ],
                        ));
              },
              child: const Text('Mostrar Alerta'),
            ),
            const SizedBox(height: 10.0),
            Text(state ? 'Si' : 'No'),
          ],
        ),
      ),
    );
  }
}
