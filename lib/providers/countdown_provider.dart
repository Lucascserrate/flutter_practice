import 'dart:async';

import 'package:flutter/material.dart';

class CountdownProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 75);
  bool isRunning = false;

  // subscription
  StreamSubscription<int>? _tickSuscription;

  void timerToggle() {
    if (!isRunning) {
      _startTimer(duration.inSeconds);
    } else {
      _tickSuscription?.pause();
    }
    isRunning = !isRunning;
    notifyListeners();
  }

  void _startTimer(int second) {
    _tickSuscription?.cancel();
    _tickSuscription = Stream<int>.periodic(
            const Duration(seconds: 1), (sec) => second - sec - 1)
        .take(second)
        .listen((event) {
      duration = Duration(seconds: event);
      notifyListeners();
    });
  }

  void resetDuration(Duration newDuration) {
    isRunning = false;
    _tickSuscription?.cancel();
    duration = newDuration;
    notifyListeners();
  }

  String get timeLeftString {
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
