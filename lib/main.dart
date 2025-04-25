import 'package:flutter/material.dart';
import 'register.dart'; // Import the Admin home screen
import 'package:tubes/Admin/medlog.dart';

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
      home: RegisterScreen(), 
    );
  }
}
