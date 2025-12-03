import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/api_service.dart';
import '../hive/hive_service.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late Future<List<Album>> albumsFuture;

  @override
  void initState() {
    super.initState();
    albumsFuture = loadData();
  }

  Future<List<Album>> loadData() async {
    try {
      final albums = await ApiService.fetchAlbums();
      HiveService.saveAlbums(albums);
      return albums;
    } catch (e) {
      return HiveService.getCachedAlbums(); // mode offline
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                albumsFuture = loadData();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Album>>(
        future: albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text("Chargement des albums...")
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun album trouvé"));
          }

          final albums = snapshot.data!;

          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.album),
                title: Text(albums[index].title),
                subtitle: Text("ID : ${albums[index].id}"),
              );
            },
          );
        },
      ),
    );
  }
}
