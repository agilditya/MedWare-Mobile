import 'package:flutter/material.dart';
import 'profileAdmin.dart';
import 'detail.dart';
import 'homeAdmin.dart';
import 'medlog.dart';
import 'addproduct.dart';

class Viewallproductadmin extends StatelessWidget {
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Produk Rows
            _productRow(
              context,
              "Bufect",
              "10 - 01 - 2024",
              'assets/buffect.png',
              "Sanmol",
              "10 - 01 - 2024",
              'assets/sanmol.png',
            ),
            _productRow(
              context,
              "Panadol",
              "10 - 01 - 2026",
              'assets/panadol.png',
              "Amoxsan",
              "09 - 07 - 2026",
              'assets/amoxsan.png',
            ),
            Row(
              children: [
                Expanded(
                  child: productCard(
                    "OBH \nCombi",
                    "03 - 02 - 2024",
                    'assets/obhcombi.png',
                    context,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: SizedBox()),
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
              MaterialPageRoute(builder: (context) => AddProductScreen()),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedwareHomeAdminPage(),
                    ),
                  );
                },
                child: _customNavItem('assets/home_navbar.png', 'Home', false),
              ),
              _customNavItem('assets/search_navbar.png', 'Search', true),
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

  Widget _productRow(
    BuildContext context,
    String name1,
    String date1,
    String img1,
    String name2,
    String date2,
    String img2,
  ) {
    return Row(
      children: [
        Expanded(child: productCard(name1, date1, img1, context)),
        SizedBox(width: 10),
        Expanded(child: productCard(name2, date2, img2, context)),
      ],
    );
  }

  Widget productCard(
    String productName,
    String date,
    String imagePath,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Rp 13.504',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text('Stock: 5', style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text(
            'Expired: $date',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDC5858),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 45),
              ),
              child: Text('Details', style: TextStyle(color: Colors.white)),
            ),
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
