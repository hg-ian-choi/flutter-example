class Chat {
  final String id;
  final String content;
  final int sequence;

  Chat.fromJson(Map<String, dynamic> data)
      : id = data['_id'] as String,
        content = data['content'] as String,
        sequence = data['sequence'] as int;
}
