import 'package:flutter/material.dart';
import '../models/entreprise.dart';

class EntrepriseDetailScreen extends StatelessWidget {
  final Entreprise entreprise;

  const EntrepriseDetailScreen({super.key, required this.entreprise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entreprise.nom),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            entreprise.image.isNotEmpty
                ? Image.network(
                    entreprise.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 200,
                    child: Icon(Icons.business, size: 100),
                  ),
            const SizedBox(height: 16),
            Text(
              entreprise.nom,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              entreprise.ville,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              entreprise.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
