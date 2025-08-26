import 'package:flutter/material.dart';

class OwnPlanPage extends StatefulWidget {
  const OwnPlanPage({Key? key}) : super(key: key);

  @override
  State<OwnPlanPage> createState() => _OwnPlanPageState();
}

class _OwnPlanPageState extends State<OwnPlanPage> {
  int _selectedIndex = 0;
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _membersController = TextEditingController();
  DateTime? _selectedDate;

  Widget _buildQuickIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF006A71),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF48A6A7),
        title: const Text("Create Your Own Plan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _toController,
              decoration: InputDecoration(
                labelText: "To ",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _fromController,
              decoration: InputDecoration(
                labelText: "From ",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _selectedDate == null
                      ? "Select Date"
                      : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _membersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Members",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            // Quick icons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickIcon(Icons.restaurant, "Food"),
                _buildQuickIcon(Icons.hotel, "Hotel"),
                _buildQuickIcon(Icons.train, "Train"),
                _buildQuickIcon(Icons.flight, "Airplane"),
                _buildQuickIcon(Icons.directions_bus, "Bus"),
              ],
            ),
            const SizedBox(height: 20),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF48A6A7),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // TODO: Save form logic
                },
                child: const Text("Save Plan", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),

      // Bottom nav with navigation logic
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
                        label: const Text(
                          "Create Your Own",
                          style: TextStyle(color: Colors.white),
                        ),
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
