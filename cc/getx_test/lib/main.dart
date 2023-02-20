import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<Controller>(
                init: Controller(),
                builder: (Controller _) => Text(
                  'Current value is: ${_.x}',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.find<Controller>().increment();
                },
                child: const Text('Add number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
