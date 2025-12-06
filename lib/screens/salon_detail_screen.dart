import 'package:flutter/material.dart';
import '../models/salon.dart';

class SalonDetailScreen extends StatelessWidget {
  final SalonStartupAfro salon;

  const SalonDetailScreen({super.key, required this.salon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salon.nom),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            salon.image.isNotEmpty
                ? Image.network(
                    salon.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 200,
                    child: Icon(Icons.event, size: 100),
                  ),
            const SizedBox(height: 16),
            Text(
              salon.nom,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${salon.ville} - ${salon.date}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              salon.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
