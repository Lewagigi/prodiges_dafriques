import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomeScreen extends StatelessWidget {

const HomeScreen({super.key});

final List<Map<String, String>> categories = const [
{'name': 'SafeReg', 'type': 'Tech'},
{'name': 'Faso Mode', 'type': 'Mode'},
{'name': 'Afrique Santé', 'type': 'Santé'},
];

@override
Widget build(BuildContext context) {


return Scaffold(
  appBar: AppBar(
    title: const Text('Prodiges d\'Afrique'),
    backgroundColor: Colors.brown,
  ),
  body: ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: categories.length,
    itemBuilder: (context, index) {

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: const Icon(Icons.category),
          title: Text(categories[index]['name']!),
          subtitle: Text(categories[index]['type']!),
          onTap: () => Navigator.pushNamed(context, '/community'),
        ),
      );

    },
  ),
);


}
}