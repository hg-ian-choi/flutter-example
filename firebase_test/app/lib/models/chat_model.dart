class Chat {
  final String id;
  final String content;
  final int sequence;

  Chat({required this.id, required this.content, required this.sequence});

  Chat.fromJson(Map<String, dynamic> data)
      : id = data['_id'],
        content = data['content'],
        sequence = data['sequence'];
}
