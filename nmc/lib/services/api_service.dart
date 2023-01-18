import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nmc/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8088/flutter';
  final String method = 'get';

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$method');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
