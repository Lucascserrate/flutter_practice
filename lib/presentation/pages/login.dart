import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://i.pinimg.com/564x/78/06/ab/7806abf4c1497b433c9b4bfc67b0ac5e.jpg'),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text('Sign in'),
            userInput(),
            passwordInput(),
            button(context),
          ],
        ),
      ),
    );
  }
}

Widget text(value) {
  return Text(
    value,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget userInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'User',
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget passwordInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget button(BuildContext context) {
  return TextButton(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 50.0)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
    onPressed: () {},
    child: const Text('Enter'),
  );
}
