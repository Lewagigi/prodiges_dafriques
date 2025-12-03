import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/salon.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/community_screen.dart';
import 'screens/album_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialisation Hive
  await Hive.initFlutter();

  // ✅ Boîte pour les utilisateurs
  await Hive.openBox('users');

  // ✅ Enregistrement de l’adaptateur SalonStartupAf
  Hive.registerAdapter(SalonStartupAfroAdapter());


  // ✅ Boîtes pour albums et salons
  await Hive.openBox<SalonStartupAfro>('salonsBox');
 

  runApp(const ProdigesApp());
}

class ProdigesApp extends StatelessWidget {
  const ProdigesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/': (context) => const AlbumScreen(),
        '/auth': (context) => const AuthScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/community': (context) => const CommunityScreen(),
        '/albums': (context) => const AlbumScreen(),
      },
    );
  }
}
