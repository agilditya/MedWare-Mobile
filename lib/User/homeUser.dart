import 'package:flutter/material.dart';

import 'orderpage.dart';
import 'ViewProductUser.dart';
import 'profile.dart';

class MedwareHomeUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ApotekSejahtera21',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 216, 36),
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
              ],
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage('assets/apotik_anugerah.png'),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Viewallproductuser(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                dashboardTile(
                  "PAY",
                  "Payment for customers",
                  Colors.green,
                  'assets/payment.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPageScreen(),
                      ),
                    );
                  },
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

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: _imageTextNavItem(
                  'assets/home_navbar.png',
                  'Home',
                  true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Viewallproductuser(),
                    ),
                  );
                },
                child: _imageTextNavItem(
                  'assets/search_navbar.png',
                  'Search',
                  false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPageScreen()),
                  );
                },
                child: _imageTextNavItem('assets/pay_navbar.png', 'Pay', false),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutStaffPage()),
                  );
                },
                child: _imageTextNavItem(
                  'assets/profile_navbar.png',
                  'Profile',
                  false,
                ),
              ),
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
    String imagePath, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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

  Widget _imageTextNavItem(String assetPath, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetPath,
          height: 24,
          width: 24,
          color: isActive ? Colors.redAccent : Colors.black,
        ),
        SizedBox(height: 4),
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
