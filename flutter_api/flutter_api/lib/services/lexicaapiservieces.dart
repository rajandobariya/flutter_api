import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/model/lexica.dart';

class LexicaApiService {
  Future<List<Lexica>> getPhotos() async {
    final response =
        await http.get(Uri.parse("https://lexica.art/api/infinite-prompts"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['images'];
      final List<Lexica> lexicaList =
          jsonData.map((json) => Lexica.fromJson(json)).toList();
      return lexicaList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
