import 'package:flutter/material.dart';
import 'package:nmc/screens/home_screen.dart';
import 'package:nmc/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
