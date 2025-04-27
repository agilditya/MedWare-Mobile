import 'package:flutter/material.dart';
import 'viewProductUser.dart'; // Halaman produk user (pastikan path-nya sesuai)
import 'orderpage.dart'; // Halaman order
import 'profile.dart'; // Halaman profil user
import 'homeUser.dart'; // Halaman HomeUserPage yang akan diarahkan
import 'detail.dart'; // Halaman detail produk

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Viewallproductuser(),
              ), // Ganti dengan halaman ViewProductUser
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset('assets/amoxsan.png', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Amoxsan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Rp 23.500',
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Category: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Obat'),
                ],
              ),
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Description: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          'Amoxsan adalah antibiotik yang mengandung Amoxicillin, digunakan untuk mengobati berbagai infeksi bakteri seperti infeksi saluran pernapasan, infeksi saluran kemih, dan infeksi kulit.',
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Composition: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'Amoxicillin Trihydrate 500 mg'),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Side Effects: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          'Mual, muntah, diare, reaksi alergi seperti ruam, gatal, atau pembengkakan, gangguan pencernaan ringan',
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Expired: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '2025-06-15'),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Code: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'AMX500-001'),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Stock: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '50'),
                  ],
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
