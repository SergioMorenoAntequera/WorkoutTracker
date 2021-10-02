import 'package:http/http.dart' as http;

class Internet {
  static get(url) async {
    url = Uri.parse(url);
    var response = await http.get(url);
    return response.body;
  }
}
