import 'package:firebase_test/models/chat_model.dart';
import 'package:firebase_test/models/message_model.dart';
import 'package:firebase_test/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  MessageService messageService = MessageService();

  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://localhost:8080');
  final TextEditingController controller = TextEditingController();

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      channel.sink.add('Hello, World!');
    }
  }

  @override
  void initState() {
    super.initState();
    messageService.getChatList();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message title'),
      ),
      body: Row(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>?>(
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
          ),
          // Expanded(
          //   child: StreamBuilder<List<Chat>>(
          //     stream: messageService.getChatList(),
          //     builder: (BuildContext context_, AsyncSnapshot<List<Chat>> asyncSnapshot_) {
          //       if (!asyncSnapshot_.hasData) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else if (asyncSnapshot_.hasError) {
          //         return const Center(
          //           child: Text('Error!'),
          //         );
          //       } else {
          //         List<MessageModel> messages = asyncSnapshot_.data!;
          //         return Column(
          //           mainAxisSize: MainAxisSize.max,
          //           children: [
          //             Expanded(
          //               child: ListView.builder(
          //                 itemCount: messages.length,
          //                 itemBuilder: (BuildContext itemBuilderContext_, int index_) => ListTile(
          //                   title: Text(messages[index_].content),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // messageService.getChatList();
          sendMessage();
        },
      ),
    );
  }
}
