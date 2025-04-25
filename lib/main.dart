import 'package:flutter/material.dart';
import 'Admin/home.dart'; // Ganti dengan path file kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MedwareHomePage(), // GANTI SCREEN YANG MAU DILIAT
    );
  }
}
