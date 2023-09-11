import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:setting_screen/Screens/AboutScreen.dart';
import 'package:setting_screen/Screens/SecondScreen.dart';
import 'Screens/MainScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAQUa8xql3kEsHZ2o8cKhKXlvP4O4AP1Hs",
        appId: "1:1040311867954:web:a4ff790548a6fa2ec47a2b",
        messagingSenderId: "1040311867954",
        projectId: "app-final-82c91",
    )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

