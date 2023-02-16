import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu_test/hidden_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HiddenDrawer(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
