import 'package:flutter/material.dart';
import '../models/salon.dart';
import '../repositories/salon_repository.dart';

class SalonListScreen extends StatefulWidget {
  const SalonListScreen({super.key});

  @override
  State<SalonListScreen> createState() => _SalonListScreenState();
}

class _SalonListScreenState extends State<SalonListScreen> {
  final SalonRepository _repository = SalonRepository();
  late Future<List<SalonStartupAfro>> _salonsFuture;

  @override
  void initState() {
    super.initState();
    _salonsFuture = _repository.loadSalonsWithCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Salons Startup Afro")),
      body: FutureBuilder<List<SalonStartupAfro>>(
        future: _salonsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final salons = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: salons.length,
            itemBuilder: (context, index) {
              final salon = salons[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          salon.image,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // TITRE
                      Text(
                        salon.nom,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // DESCRIPTION + INFOS
                      Text(salon.description),
                      Text("📅 ${salon.date}"),
                      Text("📍 ${salon.ville}"),

                      const SizedBox(height: 16),

                      // ⭐️ BOUTONS AJOUTÉS ICI ⭐️
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // BOUTON VOIR DÉTAILS
                              ElevatedButton(
                                onPressed: () {
                                  // todo: ouvrir un écran détails
                                },
                                child: const Text("Voir détails"),
                              ),

                              // BOUTON PARTICIPER
                              OutlinedButton(
                                onPressed: () {
                                  // todo: action participer
                                },
                                child: const Text("Participer"),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // BOUTON PARTAGER
                              TextButton.icon(
                                onPressed: () {
                                  // todo: partager
                                },
                                icon: const Icon(Icons.share),
                                label: const Text("Partager"),
                              ),

                              // BOUTON FAVORIS
                              IconButton(
                                onPressed: () {
                                  // todo: ajouter aux favoris
                                },
                                icon: const Icon(Icons.favorite_border),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
