import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart'; // Import the file where RegisterScreen is defined

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
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/MedWare.png', height: 100),
              const SizedBox(height: 20),
              Image.asset('assets/dashboard.png', height: 300),
              const SizedBox(height: 20),
              Text(
                'OPTIMIZE YOUR MEDICAL STOCK WITH US',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22, // Increased size
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Serves as a digital ledger for keeping track of all medical supplies, from medications to medical equipment.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.red.shade300),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman login
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ), // Corrected class name
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  // Navigasi ke halaman sign up
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              RegisterScreen(), // Navigate to RegisterScreen
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade400,
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(color: Colors.red.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Sign Up', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
