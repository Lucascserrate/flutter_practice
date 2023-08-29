import 'package:flutter/material.dart';
import 'package:flutterapp/providers/countdown_provider.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountdownProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
        actions: [
          IconButton(
              onPressed: () {
                countdownProvider.resetDuration(const Duration(seconds: 60));
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),
      body: const Center(
        child: _CounterLabel(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countdownProvider.timerToggle();
        },
        child: Icon(
          countdownProvider.isRunning ? Icons.pause : Icons.play_arrow_outlined,
        ),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  const _CounterLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.timer_outlined,
            color: Colors.blue,
            size: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            context.select(
                (CountdownProvider countdown) => countdown.timeLeftString),
            style: const TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
