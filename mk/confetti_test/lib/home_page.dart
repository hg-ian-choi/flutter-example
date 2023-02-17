import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _confettiController = ConfettiController();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _confettiController.stop();
                } else {
                  _confettiController.play();
                }
                isPlaying = !isPlaying;
              },
              color: Colors.deepPurple.shade200,
              child: const Text('On button press'),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirection: pi / 2,
          colors: const [
            Colors.deepPurple,
            Colors.yellow,
          ],
          gravity: 0.01,
          emissionFrequency: 0.1,
        ),
      ],
    );
  }
}
