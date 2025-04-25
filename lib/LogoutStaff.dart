import 'package:flutter/material.dart';

class LogoutStaffPage extends StatelessWidget {
  const LogoutStaffPage({Key? key}) : super(key: key);

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Log out of staff?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text("You will be logged out of your account"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFD9534F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Log Out", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFD9534F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // TODO: Tambahkan logika logout di sini
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", false),
              _buildNavItem(Icons.search, "Search", false),
              ElevatedButton(
                onPressed: () {
                  // Tambah aksi
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(12),
                  backgroundColor: Colors.redAccent,
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              _buildNavItem(Icons.inventory_2, "Log", false),
              _buildNavItem(Icons.person, "Profile", true), // aktifkan profile
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFFD9534F),
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                const Text("Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const CircleAvatar(radius: 50, backgroundColor: Colors.grey),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Staff", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Setting Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: const Text("My Profile"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Aksi ke halaman profil
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text("Change Password"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Aksi ke halaman ubah password
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _showLogoutDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide.none,
                  shadowColor: Colors.black.withOpacity(0.1),
                  elevation: 4,
                ),
                child: const Text("Log Out", style: TextStyle(color: Colors.black87, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.redAccent : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.redAccent : Colors.black,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
