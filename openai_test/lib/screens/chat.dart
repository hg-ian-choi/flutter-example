import 'package:flutter/material.dart';
import 'package:openai_test/components/bubble_modal.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.imagePath),
            const SizedBox(height: 20),
            CustomPaint(
              painter: BubbleModal(),
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(15),
                //     topRight: Radius.circular(15),
                //     bottomLeft: Radius.circular(15),
                //   ),
                //   border: Border.all(
                //     width: 1,
                //     color: Colors.black,
                //   ),
                // ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    print('onButtonClick!!!');
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'Hello, World!',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
