import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4; // Profile tab index

  @override
  Widget build(BuildContext context) {
    // Color palette
    const bgColor = Color(0xFFF2EFE7);
    const lightBlue = Color(0xFF9ACBD0);
    const teal = Color(0xFF48A6A7);
    const darkTeal = Color(0xFF006A71);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: lightBlue,
                    // backgroundImage: const AssetImage('assets/images/user_avatar.png'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Khushi Sen",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkTeal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoTile(Icons.phone, "Contact", "+91 98765 43210"),
            _buildInfoTile(Icons.email, "Email", "khushi@example.com"),
            _buildInfoTile(Icons.cake, "Date of Birth", "01 Jan 2000"),
            _buildInfoTile(Icons.person, "Gender", "Female"),
            const SizedBox(height: 20),
            _buildActionTile(
              icon: Icons.credit_card,
              title: "Aadhaar Verification",
              onTap: () {
                Navigator.pushNamed(context, '/aadhaar');
              },
            ),
            _buildActionTile(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),

            
            // const SizedBox(height: 20),
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: darkTeal,
            //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            //   icon: const Icon(Icons.logout, color: Colors.white),
            //   label: const Text(
            //     "Logout",
            //     style: TextStyle(color: Colors.white, fontSize: 16),
            //   ),
            //   onPressed: () {
            //     // Logout logic
            //   },
            // ),
          ],
        ),
      ),

      // ⬇️ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF48A6A7),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/mySpace');
          } else if (index == 2) {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.brush, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF48A6A7),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/ownPlan');
                        },
                        label: const Text("Create Your Own", style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.format_align_left, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006A71),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/tripForm');
                        },
                        label: const Text("Fill Out Form", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/explore');
          } else if (index == 4) {
            // Already on Profile
          }
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "My Space"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF006A71)),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  Widget _buildActionTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF48A6A7)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
