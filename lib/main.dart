import 'package:flutter/material.dart';
import 'package:tubes/Admin/medlog.dart';
import 'Admin/medlog.dart'; // Ganti dengan path file kamu

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
      home: MedLogPage(), // GANTI SCREEN YANG MAU DILIAT
    );
  }
}
