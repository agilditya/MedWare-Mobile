import 'package:flutter/material.dart';

void main() {
  runApp(MedwareApp());
}

class MedwareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedwareHomeUserPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MedwareHomeUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ApotekSejahtera21',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Staff',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage('assets/logo_apotek.png'),
            ),
          ],
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
                        "VIEW",
                        "View all products",
                        Colors.purple,
                        'assets/view.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Tile PAY sendiri
                dashboardTile(
                  "PAY",
                  "Payment for customers",
                  Colors.green,
                  'assets/pay.png',
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

      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          shape: CircleBorder(),
          child: Image.asset('assets/add_navbar.png', height: 32, width: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _customNavItem('assets/home_navbar.png', 'Home', true),
              _customNavItem('assets/search_navbar.png', 'Search', false),
              SizedBox(width: 40),
              _customNavItem('assets/log_navbar.png', 'Log', false),
              _customNavItem('assets/profile_navbar.png', 'Profile', false),
            ],
          ),
        ),
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
      margin: EdgeInsets.only(bottom: 10), // Jarak antar tile
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
              height: 130,
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

  Widget _customNavItem(String assetPath, String label, bool isActive) {
    double iconHeight = label == 'Log' ? 30 : 24;
    double iconWidth = label == 'Log' ? 30 : 24;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetPath,
          height: iconHeight,
          width: iconWidth,
          color: isActive ? Colors.redAccent : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.redAccent : Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
