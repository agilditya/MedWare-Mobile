import 'package:flutter/material.dart';
import 'detail.dart'; // ganti sesuai nama file dan lokasi file kamu

void main() {
  runApp(const MedWareApp());
}

class MedWareApp extends StatelessWidget {
  const MedWareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedWare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
    );
  }
}
