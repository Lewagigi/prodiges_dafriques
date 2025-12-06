import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void registerUser() async {
    final nom = _nomController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (nom.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    final usersBox = Hive.box<User>('usersBox');

    // Vérifie si l’email existe déjà
    final emailExists = usersBox.values.any((user) => user.email == email);
    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cet email est déjà utilisé")),
      );
      return;
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nom: nom,
      email: email,
      password: password,
      isConnected: true,
    );

    await usersBox.put(user.id, user);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Mot de passe"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
