import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {

const AuthScreen({super.key});

@override
Widget build(BuildContext context) {


return Scaffold(
  body: Center(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(Icons.map, size: 100),

          const SizedBox(height: 20),

          const Text(
            'PRODIGES D\'AFRIQUE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Découvre, inspire, entreprends',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/register'),
            child: const Text('Créer un compte'),
          ),

          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Se connecter'),
          ),

          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/home'),
            child: const Text('Continuer sans compte'),
          ),

        ],
      ),
    ),
  ),
);


}
}