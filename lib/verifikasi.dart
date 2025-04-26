import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'User/homeUser.dart';
import 'Admin/homeAdmin.dart';

void main() {
  runApp(
    MaterialApp(home: VerificationScreen(), debugShowCheckedModeBanner: false),
  );
}

class VerificationScreen extends StatefulWidget {
  // Constructor dengan required role
  VerificationScreen();

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeController = List<TextEditingController>.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3D0D3), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      "Almost there!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please enter the verification code that was sent to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Image.asset('assets/email_verification.png', height: 200),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 45,
                          child: TextField(
                            controller: _codeController[index],
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "*This field is required",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String code = _codeController.map((c) => c.text).join();
                        print("Kode verifikasi: $code");

                        // Simplified verification logic
                        if (code == '123456') {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text("Verifikasi Berhasil"),
                                  content: Text("Kode berhasil diverifikasi."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    MedwareHomeUserPage(), // Default to user home
                                          ),
                                        );
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Kode verifikasi salah")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD14C4C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        "Verify Code",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
