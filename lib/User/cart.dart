import 'package:flutter/material.dart';
import 'homeuser.dart'; // Import halaman Home
import 'orderpage.dart'; // Import halaman OrderPageScreen

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PaymentPage());
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool paymentSuccess = false;

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm Payment'),
            content: Text('Are you sure you want to confirm the payment?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // No
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  setState(() {
                    paymentSuccess = true;
                  });

                  // Menunggu 2 detik sebelum menampilkan dialog untuk kembali ke Home
                  Future.delayed(Duration(seconds: 2), () {
                    _showHomeRedirectDialog();
                  });
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  void _showHomeRedirectDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Payment Successful'),
            content: Text('Do you want to go back to the Home page?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Tetap di halaman ini
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Menutup dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedwareHomeUserPage(),
                    ),
                  );
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  Widget _buildItem(String name, String quantity, String id, String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Quantity : $quantity'),
                Text('Transaction ID\n$id', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('23 Sep 2023\n7:34 AM', style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OrderPageScreen()),
            );
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'CART',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildItem('Amoxsan', '1', 'AMX500-001', 'Rp. 23.500'),
              _buildItem('Panadol', '2', 'AMX500-002', 'Rp. 27.008'),
              Spacer(),
              if (paymentSuccess)
                Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(), // Loading spinner
                      SizedBox(height: 16),
                      Text(
                        'Payment Berhasil!',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _showConfirmDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
