import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MedWareApp());
}

class MedWareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedWare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
      home: DashboardScreen(),
    );
  }
}
