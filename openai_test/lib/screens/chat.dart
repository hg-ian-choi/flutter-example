import 'package:flutter/material.dart';
import 'package:openai_test/services/google_service.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _googleService = GoogleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT-3'),
      ),
      body: Column(
        children: [
          Image.network(widget.imagePath),
        ],
      ),
    );
  }
}
