import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8088/flutter';
  final String method = 'get';

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$method');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
