import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/salon.dart';
import 'models/entreprise.dart';

import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/community_screen.dart';
import 'screens/album_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // 🔹 Adapter Salons
  Hive.registerAdapter(SalonStartupAfroAdapter());

  // 🔹 Adapter Entreprise
  Hive.registerAdapter(EntrepriseAdapter());

  // 🔹 Boxes Hive
  await Hive.openBox('users');
  await Hive.openBox<SalonStartupAfro>('salonsBox');
 await Hive.openBox<Entreprise>('entreprisesBox');


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
