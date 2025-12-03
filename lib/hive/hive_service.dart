import 'package:hive/hive.dart';
import '../models/album.dart';

class HiveService {
  static Future<void> saveAlbums(List<Album> albums) async {
    final box = Hive.box('albums');
    final list = albums.map((a) => a.toJson()).toList();
    box.put('data', list);
  }

  static List<Album> getCachedAlbums() {
    final box = Hive.box('albums');
    final list = box.get('data', defaultValue: []);
    return (list as List).map((json) => Album.fromJson(json)).toList();
  }
}
