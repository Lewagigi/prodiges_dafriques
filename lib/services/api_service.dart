import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';

class ApiService {
  static Future<List<Album>> fetchAlbums() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception("Impossible de charger les albums");
    }
  }
}
