import 'package:flutter/material.dart';

void main() {
  runApp(MedwareApp());
}

class MedwareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedwareHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MedwareHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          'Medware',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: dashboardTile(
                        "53",
                        "Products are in Your Ware",
                        Colors.redAccent,
                        'assets/barang.png',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: dashboardTile(
                        "ADD",
                        "Add new products",
                        Colors.blueAccent,
                        'assets/add.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: dashboardTile(
                        "VIEW",
                        "View all products",
                        Colors.purple,
                        'assets/view.png',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: dashboardTile(
                        "LOG",
                        "view activity history",
                        Colors.green,
                        'assets/log.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Recent Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: productCard(
                    "Bufect",
                    "10 - 01 - 2024",
                    'assets/buffect.png',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: productCard(
                    "Sanmol",
                    "10 - 01 - 2024",
                    'assets/sanmol.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Log"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget dashboardTile(
    String title,
    String subtitle,
    Color color,
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              imagePath,
              height: 130, // Perbesar gambar dari 40 ke 60
              width: 130,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }

  Widget productCard(String productName, String date, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[100],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
          ),
          SizedBox(height: 8),
          Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            'Added: $date',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
