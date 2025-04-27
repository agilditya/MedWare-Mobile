import 'package:flutter/material.dart';
import 'Admin/homeAdmin.dart';

void main() {
  runApp(MedWareApp());
}

class MedWareApp extends StatelessWidget {
  const MedWareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedWare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
      home: MedwareHomeAdminPage(),
    );
  }
}
