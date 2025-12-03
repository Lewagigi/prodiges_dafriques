import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prodiges_dafriques/repositories/salon_repository.dart';

import '../models/salon.dart';
import 'salon_list_screen.dart'; //  🔥 IMPORTANT : importer l’écran

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = SalonRepository();
  List<SalonStartupAfro> salons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });
    final data = await repository.loadSalonsWithCache();
    setState(() {
      salons = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salons / Startups Afro"),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadData,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: salons.length,
              itemBuilder: (context, index) {
                final salon = salons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: salon.image.isNotEmpty
                        ? Image.network(salon.image, width: 50, height: 50)
                        : const Icon(Icons.business),
                    title: Text(salon.nom),
                    subtitle: Text("${salon.description}\n${salon.ville} - ${salon.date}"),
                    isThreeLine: true,

                    // ⭐️ Navigation ajoutée ici
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SalonListScreen(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
