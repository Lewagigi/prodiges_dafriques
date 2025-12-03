// lib/utils.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void logout(BuildContext context) async {
  // Optionnel : vider la session si tu en as une
  // Hive.box('session').clear();

  // Redirige vers l'écran Auth et supprime l'historique
  Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
}
