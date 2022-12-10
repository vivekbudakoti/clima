import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    var repsonse = await http.get(Uri.parse(url));

    if (repsonse.statusCode == 200) {
      var jsonResponse = jsonDecode(repsonse.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print(repsonse.statusCode);
    }
  }
}
