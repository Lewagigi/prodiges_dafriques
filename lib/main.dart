import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/salon.dart';
import 'models/entreprise.dart';
import 'models/user.dart';
import 'models/user_adapter.dart' hide UserAdapter; // 🔹 Adapter Hive

import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/community_screen.dart';
import 'screens/album_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // 🔹 Adapters Hive
  Hive.registerAdapter(SalonStartupAfroAdapter());
  Hive.registerAdapter(EntrepriseAdapter());
  Hive.registerAdapter(UserAdapter()); // 🔹 Adapter User

  // 🔹 Ouverture des boxes Hive
  await Hive.openBox<SalonStartupAfro>('salonsBox');
  await Hive.openBox<Entreprise>('entreprisesBox');
  await Hive.openBox<User>('usersBox');

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
