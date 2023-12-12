import 'dart:convert';
import 'package:flutter_api/model/photos.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Photo>?> getPhotos() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos?albumId=1");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Photo(
          url: e['url'],
          text: e['title'],
        );
      }).toList();
      return todos;
    }
  }
}
