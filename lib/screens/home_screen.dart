import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prodiges_dafriques/repositories/salon_repository.dart';

import '../models/salon.dart';
import '../models/entreprise.dart';
import 'create_entreprise_screen.dart';
import 'salon_detail_screen.dart';
import 'entreprise_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = SalonRepository();

  List<SalonStartupAfro> salons = [];
  List<Entreprise> entreprises = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() => isLoading = true);

    final salonsData = await repository.loadSalonsWithCache();
    final entreprisesBox = Hive.box<Entreprise>('entreprisesBox');

    setState(() {
      salons = salonsData;
      entreprises = entreprisesBox.values.cast<Entreprise>().toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salons & Entreprises Afro"),
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
              itemCount: salons.length + entreprises.length,
              itemBuilder: (context, index) {
                if (index < salons.length) {
                  final salon = salons[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: salon.image.isNotEmpty
                          ? Image.network(salon.image, width: 50, height: 50)
                          : const Icon(Icons.event),
                      title: Text(salon.nom),
                      subtitle:
                          Text("${salon.description}\n${salon.ville} - ${salon.date}"),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SalonDetailScreen(salon: salon),
                          ),
                        );
                      },
                    ),
                  );
                }

                final entreprise = entreprises[index - salons.length];
                return Card(
                  color: Colors.orange.shade50,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: entreprise.image.isNotEmpty
                        ? Image.network(entreprise.image, width: 50, height: 50)
                        : const Icon(Icons.business),
                    title: Text(entreprise.nom),
                    subtitle: Text("${entreprise.ville}\n${entreprise.description}"),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EntrepriseDetailScreen(entreprise: entreprise),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateEntrepriseScreen()),
          ).then((_) => loadData());
        },
        label: const Text("Créer une entreprise"),
        icon: const Icon(Icons.add_business),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
