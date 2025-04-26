import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: Text(
                'Forgot Password',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: Text(
                'Please enter your email. We will send you an email to reset your password.',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 24),
            Image.asset('assets/forgotPass.png', height: 350),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: Text(
                "Email Address",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType:
                  TextInputType.emailAddress, // Tambahkan keyboardType
              autofocus: true, // Automatically focus the input field
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: GoogleFonts.poppins(
                  color:
                      Colors.black54, // Set label color to black before focus
                ),
                hintText: 'Enter Email Address',
                hintStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ), // Set focus color to grey
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Request Email',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[400])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or',
                    style: GoogleFonts.poppins(color: Colors.black54),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[400])),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ); // Navigate to LoginScreen directly
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Back to Login',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
