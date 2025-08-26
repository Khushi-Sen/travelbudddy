import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = "English";
  int _selectedIndex = 4; // Profile tab index

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF2EFE7);
    const lightBlue = Color(0xFF9ACBD0);
    const teal = Color(0xFF48A6A7);
    const darkTeal = Color(0xFF006A71);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: teal,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            activeColor: teal,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: darkModeEnabled,
            activeColor: darkTeal,
            onChanged: (value) {
              setState(() {
                darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: const Text("Language"),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>['English', 'Hindi', 'Spanish', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, '/privacyPolicy');
            },
          ),
          ListTile(
            title: const Text("Terms & Conditions"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, '/terms');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              // logout logic here
            },
          ),
        ],
      ),

      // NAVBAR same as Dashboard
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: teal,
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
                          backgroundColor: teal,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/ownPlan');
                        },
                        label: const Text(
                          "Create Your Own",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.format_align_left, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkTeal,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/tripForm');
                        },
                        label: const Text(
                          "Fill Out Form",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/explore');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/profile');
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
}

