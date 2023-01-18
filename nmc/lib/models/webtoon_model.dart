class WebtoonModel {
  final String id, title, thumbnail;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumbnail = json['thumbnail'];
}
