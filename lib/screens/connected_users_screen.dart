import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user.dart';

class ConnectedUsersScreen extends StatefulWidget {
  const ConnectedUsersScreen({super.key});

  @override
  State<ConnectedUsersScreen> createState() => _ConnectedUsersScreenState();
}

class _ConnectedUsersScreenState extends State<ConnectedUsersScreen> {
  List<User> connectedUsers = [];

  @override
  void initState() {
    super.initState();
    loadConnectedUsers();
  }

  void loadConnectedUsers() {
    final usersBox = Hive.box<User>('usersBox');
    setState(() {
      connectedUsers = usersBox.values
          .where((user) => user.isConnected)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Utilisateurs Connectés"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadConnectedUsers,
          ),
        ],
      ),
      body: connectedUsers.isEmpty
          ? const Center(child: Text("Aucun utilisateur connecté."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: connectedUsers.length,
              itemBuilder: (context, index) {
                final user = connectedUsers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.person, size: 40),
                    title: Text(user.nom),
                    subtitle: Text(user.email),
                  ),
                );
              },
            ),
    );
  }
}
