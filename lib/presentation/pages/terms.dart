import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class Terms extends StatelessWidget {
  final String texto;
  const Terms(this.texto, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and conditions'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Terminos y condiciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicaciobn es necesario que aceptes los terminos y condiciones',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              'Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicaciobn es necesario que aceptes los terminos y condiciones',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              'Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicacion es necesario que aceptes los terminos y condiciones, Para usar esta aplicaciobn es necesario que aceptes los terminos y condiciones',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(texto),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp())),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Aceptar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
