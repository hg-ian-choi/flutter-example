import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/models/chat_model.dart';
import 'package:firebase_test/models/message_model.dart';
import 'package:firebase_test/models/response_model.dart';
import 'package:http/http.dart' as http;

class MessageService {
  Stream<List<MessageModel>> streamMessages() {
    try {
      final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
          .collection('chatrooms/pzzpJ0YTlB6a3ux95Oyd/messages')
          .snapshots();

      return snapshots.map((QuerySnapshot querySnapshot_) {
        List<MessageModel> messages = <MessageModel>[];
        for (var element_ in querySnapshot_.docs) {
          messages.add(
              MessageModel.fromMap(id: element_.id, map: element_.data() as Map<String, dynamic>));
        }
        return messages;
      });
    } catch (error_) {
      log('Error ============> ', error: error_.toString(), stackTrace: StackTrace.current);
      return Stream.error(error_.toString());
    }
  }

  Future<Stream<List<Chat>>> getChatList() async {
    final StreamController<List<Chat>> streamController = StreamController<List<Chat>>.broadcast();
    final Stream<List<Chat>> stream = streamController.stream;

    List<Chat> chatList = <Chat>[];
    try {
      http.Response response = await http.get(Uri.parse('http://localhost:8080/chat'));
      ResponseModel<List<dynamic>> result = ResponseModel.fromJson(jsonDecode(response.body));
      for (var element in result.data) {
        chatList.add(Chat.fromJson(element));
      }
    } catch (error_) {
      print(error_);
    }

    streamController.add(chatList);
    return stream;
  }
}
