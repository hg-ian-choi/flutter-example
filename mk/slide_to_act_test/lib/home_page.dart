import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide_to_act Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SlideAction(
            borderRadius: 12,
            elevation: 0,
            innerColor: Colors.deepPurple,
            outerColor: Colors.deepPurple.shade200,
            sliderButtonIcon: const Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            text: 'Slide to Unlock',
            sliderRotate: false,
            onSubmit: () {
              print('unLock');
            },
          ),
        ),
      ),
    );
  }
}
