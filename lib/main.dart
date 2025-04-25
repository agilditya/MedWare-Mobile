import 'package:flutter/material.dart';
import 'User/LogoutStaff.dart'; // Import the LogoutStaff screen

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
      home: LogoutStaffPage(), // Set the initial screen to LogoutStaffPage
    );
  }
}
