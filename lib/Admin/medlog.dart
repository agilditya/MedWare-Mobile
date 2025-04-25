import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MedLogPage()));
}

class MedLogPage extends StatelessWidget {
  final List<Map<String, String>> logs = [
    {
      'type': 'Stock out',
      'product': 'Amoxsan',
      'transactionId': 'AMX500-001',
      'date': '23 Sep 2023',
      'time': '7:34 AM',
      'stock': '15',
    },
    {
      'type': 'Stock in',
      'product': 'Panadol',
      'transactionId': 'AMX500-001',
      'date': '19 Sep 2023',
      'time': '19:34 AM',
      'stock': '20',
    },
    {
      'type': 'Stock in',
      'product': 'Amoxsan',
      'transactionId': 'AMX500-001',
      'date': '17 Sep 2023',
      'time': '10:34 AM',
      'stock': '20',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'MedLog',
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          log['type']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          log['product']!,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Transaction ID',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          log['transactionId']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Stock : ${log['stock']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        log['date']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        log['time']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Floating Action Button (Tengah Bulat)
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          shape: CircleBorder(),
          child: Image.asset(
            'assets/add_navbar.png', // Gambar custom tombol tengah
            height: 32, // Gambar dibesarkan
            width: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _customNavItem('assets/home_navbar.png', 'Home', false),
              _customNavItem('assets/search_navbar.png', 'Search', false),
              SizedBox(width: 40), // Space for FAB
              _customNavItem('assets/log_navbar.png', 'Log', true),
              _customNavItem('assets/profile_navbar.png', 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Nav Item (Gambar)
  Widget _customNavItem(String assetPath, String label, bool isActive) {
    double iconHeight = label == 'Log' ? 30 : 24; // Log lebih besar
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
