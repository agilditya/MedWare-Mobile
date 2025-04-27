import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'medlog.dart';
import 'ViewProductAdmin.dart';
import 'profileAdmin.dart';

class MedwareHomeAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ AppBar sudah disesuaikan
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
                    color: Color(0xFF525FE1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Admin',
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
            // Bagian Search DIHAPUS
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder:
                                  (_, __, ___) =>
                                      AddProductScreen(), // Ensure AddProductScreen is defined
                              transitionsBuilder: (_, animation, __, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset(0, 1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: dashboardTile(
                          "ADD",
                          "Add new products",
                          Colors.blueAccent,
                          'assets/add.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Viewallproductadmin(),
                            ),
                          );
                        },
                        child: dashboardTile(
                          "VIEW",
                          "View all products",
                          Colors.purple,
                          'assets/view.png',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      MedLogPage(), // Ensure MedLogPage is defined
                            ),
                          );
                        },
                        child: dashboardTile(
                          "LOG",
                          "view activity history",
                          Colors.orange,
                          'assets/log.png',
                        ),
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

      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => AddProductScreen(),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Viewallproductadmin(),
                    ),
                  );
                },
                child: _customNavItem(
                  'assets/search_navbar.png',
                  'Search',
                  false,
                ),
              ),
              SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedLogPage()),
                  );
                },
                child: _customNavItem('assets/log_navbar.png', 'Log', false),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutStaffPage()),
                  );
                },
                child: _customNavItem(
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
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(8),
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
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.white)),
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
