import 'package:http/http.dart' as http;

class Repository {
  static http.Client client = http.Client();
  final Uri _url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<String> fetchPosts() async {
    final response = await client.get(_url);
    return response.body;
  } 
}
