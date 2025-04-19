import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(MedWareApp());
}

class MedWareApp extends StatelessWidget {
  const MedWareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(), // Corrected class name
    );
  }
}
