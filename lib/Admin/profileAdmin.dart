import 'package:flutter/material.dart';

class LogoutStaffPage extends StatelessWidget {
  const LogoutStaffPage({Key? key}) : super(key: key);

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Log out of admin?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text("You will be logged out of your account"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFD9534F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFD9534F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFFD9534F),
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/apotik_anugerah.png'),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF525FE1), // Corrected color value
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Setting Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
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
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(color: Colors.red, width: 1), // Added border
                  shadowColor: Colors.white.withOpacity(0.1),
                  elevation: 4,
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Made text bold
                  ),
                ),
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
        Icon(icon, color: isActive ? Colors.redAccent : Colors.black),
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

  Widget _customNavItem(String iconPath, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          color: isActive ? Colors.redAccent : Colors.black,
          height: 24,
          width: 24,
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
