import 'package:flutter/material.dart';

class MySpaceScreen extends StatefulWidget {
  const MySpaceScreen({Key? key}) : super(key: key);

  @override
  State<MySpaceScreen> createState() => _MySpaceScreenState();
}

class _MySpaceScreenState extends State<MySpaceScreen> {
  int _selectedIndex = 1; // My Space tab index

  final List<Map<String, String>> sections = [
    {"title": "Old Trips", "route": "/oldTrips"},
    {"title": "New Bookings", "route": "/newBookings"},
    {"title": "Bookmarked Trips", "route": "/bookmarked"},
    {"title": "Payments", "route": "/payments"},
    {"title": "Unfinished Travel Plans", "route": "/unfinishedPlans"},
    {"title": "Itineraries", "route": "/itineraries"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE7),
      appBar: AppBar(
        title: const Text(
          "My Space",
          style: TextStyle(color: Color(0xFF006A71), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF9ACBD0),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final section = sections[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, section["route"]!);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF9ACBD0),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    section["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF006A71),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Color(0xFF006A71)),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF48A6A7),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("New trip creation coming soon!")),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF48A6A7),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, "/dashboard");
          } else if (index == 1) {
            // already here
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
                // Navigate to "Own Plan" page
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
            Navigator.pushReplacementNamed(context, "/explore");
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, "/profile");
          }
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


