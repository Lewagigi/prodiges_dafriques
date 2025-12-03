import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';





// --- SplashScreen (optionnel)
class SplashScreen extends StatelessWidget {

const SplashScreen({super.key});

@override
Widget build(BuildContext context) {


return Scaffold(
  backgroundColor: Colors.black,
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [

        Icon(
          Icons.map,
          size: 100,
          color: Colors.white,
        ),

        SizedBox(height: 20),

        Text(
          'PRODIGES D\'AFRIQUE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 10),

        Text(
          'Afrique en mouvement',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),

      ],
    ),
  ),
);

}
}

