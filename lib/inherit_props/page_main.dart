import 'package:flutter/material.dart';
import 'package:flutterapp/inherit_props/page_stateful.dart';
import 'package:flutterapp/inherit_props/page_stateless.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController(
        text: ''); // es como un estado local para controlar el valor del input
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preferences'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: 'Escribi algo',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Stateless(textController.text)),
                      );
                    },
                    child: const Text('Stateless')),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Stateful(textController.text)),
                      );
                    },
                    child: const Text('Stateful'))
              ],
            ),
          ],
        ));
  }
}
