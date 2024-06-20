import 'package:flutter/material.dart';
import 'package:mausamapp/Screens/Home_Screen.dart';
import 'package:mausamapp/Screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
