import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  static http.Client client = http.Client();
  final Uri _url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<List>? fetchPosts() async {
    final response = await client.get(_url);
    return jsonDecode(response.body) ;
  }
}
