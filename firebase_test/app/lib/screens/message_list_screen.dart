import 'package:firebase_test/models/message_model.dart';
import 'package:firebase_test/services/message_service.dart';
import 'package:flutter/material.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  MessageService messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message title'),
      ),
      body: StreamBuilder<List<MessageModel>?>(
        stream: messageService.streamMessages(),
        builder: (BuildContext context_, AsyncSnapshot<List<MessageModel>?> asyncSnapshot_) {
          if (!asyncSnapshot_.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (asyncSnapshot_.hasError) {
            return const Center(
              child: Text('Error!'),
            );
          } else {
            List<MessageModel> messages = asyncSnapshot_.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (BuildContext itemBuilderContext_, int index_) => ListTile(
                      title: Text(messages[index_].content),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
