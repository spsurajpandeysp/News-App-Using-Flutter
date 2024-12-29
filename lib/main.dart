import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/screen/HomeScreen.dart';
import 'package:news/screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
