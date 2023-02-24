import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/models/message_model.dart';

class MessageService {
  Stream<List<MessageModel>?> streamMessages() {
    try {
      final Stream<QuerySnapshot> snapshots =
          FirebaseFirestore.instance.collection('chat/K7g74GpzydHut7lUANsw/message').snapshots();

      return snapshots.map((QuerySnapshot querySnapshot_) {
        List<MessageModel> messages = <MessageModel>[];
        for (var element_ in querySnapshot_.docs) {
          messages.add(MessageModel.fromMap(id: element_.id, map: element_.data() as Map<String, dynamic>));
        }
      });
    } catch (error_) {
      log('Error ============> ', error: error_.toString(), stackTrace: StackTrace.current);
      return Stream.error(error_.toString());
    }
  }
}
