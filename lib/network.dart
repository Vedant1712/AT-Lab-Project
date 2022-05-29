import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  Network(this.url);
  final String url;

  Future<dynamic> get() async {
    var uri = Uri.parse(this.url);

    var response = await http.get(uri);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> diag() async {
    var uri = Uri.parse(this.url);

    var response = await http.get(uri);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> stats() async {
    var uri = Uri.parse(this.url);

    var response = await http.get(uri);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

}
