import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/entreprise.dart';

class CreateEntrepriseScreen extends StatefulWidget {
  const CreateEntrepriseScreen({super.key});

  @override
  State<CreateEntrepriseScreen> createState() => _CreateEntrepriseScreenState();
}

class _CreateEntrepriseScreenState extends State<CreateEntrepriseScreen> {
  final nomController = TextEditingController();
  final descriptionController = TextEditingController();
  final villeController = TextEditingController();
  final imageController = TextEditingController();

  void saveEntreprise() async {
    final box = Hive.box<Entreprise>('entreprisesBox');

    final entreprise = Entreprise(
      nom: nomController.text,
      description: descriptionController.text,
      ville: villeController.text,
      image: imageController.text, id: '',
    );

    await box.add(entreprise);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Entreprise ajoutée !")),
    );

    Navigator.pop(context); // retour au HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer une entreprise")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nomController, decoration: const InputDecoration(labelText: "Nom")),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
            TextField(controller: villeController, decoration: const InputDecoration(labelText: "Ville")),
            TextField(controller: imageController, decoration: const InputDecoration(labelText: "URL Image")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveEntreprise,
              child: const Text("Sauvegarder"),
            )
          ],
        ),
      ),
    );
  }
}
