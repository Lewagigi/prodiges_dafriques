import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/community_screen.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();
await Hive.openBox('users');

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

    '/auth': (context) => const AuthScreen(),
    '/register': (context) => const RegisterScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/community': (context) => const CommunityScreen(),

  },
);


}
}

