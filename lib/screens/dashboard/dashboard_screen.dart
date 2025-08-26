// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class DashboardScreen extends StatefulWidget {
//   final String username;

//   const DashboardScreen({Key? key, required this.username}) : super(key: key);

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen>
//     with SingleTickerProviderStateMixin {
//   final List<String> travelImages = [
//     'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
//     'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
//     'https://images.unsplash.com/photo-1526772662000-3f88f10405ff',
//     'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
//     'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef',
//     'https://images.unsplash.com/photo-1491553895911-0055eca6402d'
//   ];

//   bool showTodo = false;
//   final List<String> tasks = [];
//   final TextEditingController taskController = TextEditingController();

//   int _selectedIndex = 0;
//   bool _isQuickMenuOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2EFE7),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Greeting
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       "Hello, ${widget.username} 👋",
//                       style: const TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF006A71),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 6),
//                     const Text(
//                       "Welcome back to your travel planner!",
//                       style: TextStyle(fontSize: 18, color: Colors.black87),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Carousel
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   viewportFraction: 0.6,
//                 ),
//                 items: travelImages.map((url) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child:
//                         Image.network(url, fit: BoxFit.cover, width: double.infinity),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 20),

//               // Quick icons (darker colors)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildQuickIcon(Icons.restaurant, "Food"),
//                   _buildQuickIcon(Icons.hotel, "Hotel"),
//                   _buildQuickIcon(Icons.train, "Train"),
//                   _buildQuickIcon(Icons.flight, "Airplane"),
//                   _buildQuickIcon(Icons.directions_bus, "Bus"),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Explore some plans ✨",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // To-do section
//               Expanded(
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 400),
//                   child: showTodo
//                       ? Container(
//                           key: const ValueKey("todo"),
//                           padding: const EdgeInsets.all(14),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.85),
//                             borderRadius: BorderRadius.circular(16),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 blurRadius: 8,
//                                 offset: Offset(0, 4),
//                               )
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               // Task input bar
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextField(
//                                       controller: taskController,
//                                       decoration: InputDecoration(
//                                         hintText: "Add a new task...",
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         contentPadding: const EdgeInsets.symmetric(
//                                             horizontal: 14, vertical: 10),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(12),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFF48A6A7),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: IconButton(
//                                       icon: const Icon(Icons.add, color: Colors.white),
//                                       onPressed: () {
//                                         if (taskController.text.trim().isNotEmpty) {
//                                           setState(() {
//                                             tasks.add(taskController.text.trim());
//                                             taskController.clear();
//                                           });
//                                         }
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(height: 12),

//                               // Task list
//                               Expanded(
//                                 child: tasks.isEmpty
//                                     ? const Center(
//                                         child: Text(
//                                           "No tasks yet. Add one! 🗒️",
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 16,
//                                               fontStyle: FontStyle.italic),
//                                         ),
//                                       )
//                                     : ListView.builder(
//                                         itemCount: tasks.length,
//                                         itemBuilder: (context, index) {
//                                           return Card(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: ListTile(
//                                               leading: const Icon(
//                                                   Icons.check_circle_outline,
//                                                   color: Color(0xFF48A6A7)),
//                                               title: Text(tasks[index]),
//                                               trailing: IconButton(
//                                                 icon: const Icon(Icons.delete,
//                                                     color: Colors.redAccent),
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     tasks.removeAt(index);
//                                              });
//                                            },
//                                           ),
//                                        ),
//                                      );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : Center(
//                           key: const ValueKey("placeholder"),
//                           child: Text(
//                             "Your personalised plans will appear here.",
//                             style: TextStyle(color: Colors.grey[600]),
//                   ),
//                  ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//   // Bottom nav with navigation logic
// bottomNavigationBar: BottomNavigationBar(
//   type: BottomNavigationBarType.fixed,
//   backgroundColor: const Color(0xFF48A6A7),
//   selectedItemColor: Colors.white,
//   unselectedItemColor: Colors.white70,
//   currentIndex: _selectedIndex,
//   onTap: (index) {
//     if (index == 0) {
//       // Already on dashboard
//     } else if (index == 1) {
//       Navigator.pushReplacementNamed(context, '/chatbot');
//     } else if (index == 2) {
//       showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         builder: (_) {
//           return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.brush, color: Colors.white),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF48A6A7),
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, '/ownPlan');
//                   },
//                   label: const Text(
//                     "Create Your Own",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.format_align_left, color: Colors.white),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF006A71),
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, '/tripForm');
//                   },
//                   label: const Text(
//                     "Fill Out Form",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     } else if (index == 3) {
//       Navigator.pushReplacementNamed(context, '/splitMoney');
//     } else if (index == 4) {
//       Navigator.pushReplacementNamed(context, '/profile');
//     }
//     setState(() => _selectedIndex = index);
//   },
//   items: const [
//     BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
//     BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chatbot"),
//     BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Create"),
//     BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Split Money"),
//     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//   ],
// ),


//       // FABs
//       floatingActionButton: Stack(
//         children: [
//           // Left FAB menu
//           Positioned(
//             left: 20,
//             bottom: 20,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (_isQuickMenuOpen) ...[
//                   _buildMiniFab(Icons.support_agent, "Quick Assist"),
//                   // _buildMiniFab(Icons.money, "Split Money"),
//                   _buildMiniFab(Icons.document_scanner, "OCR"),
//                   _buildMiniFab(Icons.sos, "SOS"),
//                   // _buildMiniFab(Icons.chat, "Chatbot"),
//                   const SizedBox(height: 8),
//                 ],
//                 FloatingActionButton(
//                   backgroundColor: const Color(0xFF48A6A7),
//                   onPressed: () {
//                     setState(() {
//                       _isQuickMenuOpen = !_isQuickMenuOpen;
//                     });
//                   },
//                   child: Icon(
//                       _isQuickMenuOpen ? Icons.close : Icons.menu,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           // To-do FAB
//           Positioned(
//             right: 20,
//             bottom: 20,
//             child: FloatingActionButton(
//               backgroundColor: const Color(0xFF48A6A7),
//               onPressed: () => setState(() => showTodo = !showTodo),
//               child: const Icon(Icons.checklist, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: const Color(0xFF48A6A7), // darker color
//           child: Icon(icon, color: Colors.white),
//         ),
//         const SizedBox(height: 4),
//         Text(label, style: const TextStyle(fontSize: 12)),
//       ],
//     );
//   }

//   Widget _buildMiniFab(IconData icon, String label) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: FloatingActionButton.small(
//         backgroundColor: const Color(0xFF006A71), // darker color
//         heroTag: label,
//         onPressed: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("$label clicked!")),
//           );
//         },
//         child: Icon(icon, color: Colors.white),
//       ),
//     );
//   }

// }


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatefulWidget {
  final String username;

  const DashboardScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final List<String> travelImages = [
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
    'https://images.unsplash.com/photo-1526772662000-3f88f10405ff',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef',
    'https://images.unsplash.com/photo-1491553895911-0055eca6402d'
  ];

  bool showTodo = false;
  final List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();

  int _selectedIndex = 0;
  bool _isQuickMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE7),
      body: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Greeting
        Center(
          child: Column(
            children: [
              Text(
                "Hello, ${widget.username} 👋",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006A71),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              const Text(
                "Welcome back to your travel planner!",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Carousel
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
          ),
          items: travelImages.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(url,
                  fit: BoxFit.cover, width: double.infinity),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),

        // Quick icons
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

        // Stack: Plans & To-do Overlapping
        Expanded(
          child: Stack(
            children: [
              // Recommended Plans (background)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore some plans ✨",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPlanCard(
                          "Paris Getaway",
                          "5 days • Eiffel Tower, Louvre",
                          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
                        ),
                        _buildPlanCard(
                          "Bali Escape",
                          "7 days • Beaches, Temples",
                          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
                        ),
                        _buildPlanCard(
                          "Tokyo Adventure",
                          "6 days • Shibuya, Mount Fuji",
                          "https://images.unsplash.com/photo-1549693578-d683be217e58",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // To-do Floating Overlay
              // ✅ To-do Floating Card (overlaps plans like before)
Positioned(
  left: 16,
  right: 16,
  bottom: 80, // keep above navbar
  child: AnimatedSwitcher(
    duration: const Duration(milliseconds: 400),
    child: showTodo
        ? Container(
            key: const ValueKey("todo"),
            padding: const EdgeInsets.all(14),
            height: 440, // same size as before
            decoration: BoxDecoration(
              color: const Color(0xFF9ACBD0).withOpacity(0.95),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                // Input row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          hintText: "Add a new task...",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF48A6A7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (taskController.text.trim().isNotEmpty) {
                            setState(() {
                              tasks.add(taskController.text.trim());
                              taskController.clear();
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),

                // Task list
                Expanded(
                  child: tasks.isEmpty
                      ? const Center(
                          child: Text(
                            "No tasks yet. Add one! 🗒️",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.check_circle_outline,
                                    color: Color(0xFF48A6A7)),
                                title: Text(tasks[index],
                                    style:
                                        const TextStyle(color: Colors.black)),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      tasks.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink(),
  ),
),

            ],
          ),
        ),
      ],
    ),
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
            // Already on dashboard
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/chatbot');
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
            Navigator.pushReplacementNamed(context, '/splitMoney');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chatbot"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Split Money"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      // FABs
      floatingActionButton: Stack(
        children: [
          // Left FAB menu
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isQuickMenuOpen) ...[
                  _buildMiniFab(Icons.support_agent, "Quick Assist"),
                  _buildMiniFab(Icons.document_scanner, "OCR"),
                  _buildMiniFab(Icons.sos, "SOS"),
                  const SizedBox(height: 8),
                ],
                FloatingActionButton(
                  backgroundColor: const Color(0xFF48A6A7),
                  onPressed: () {
                    setState(() {
                      _isQuickMenuOpen = !_isQuickMenuOpen;
                    });
                  },
                  child: Icon(
                      _isQuickMenuOpen ? Icons.close : Icons.menu,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          // To-do FAB
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF48A6A7),
              onPressed: () => setState(() => showTodo = !showTodo),
              child: const Icon(Icons.checklist, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF48A6A7),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMiniFab(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FloatingActionButton.small(
        backgroundColor: const Color(0xFF006A71),
        heroTag: label,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$label clicked!")),
          );
        },
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildPlanCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF006A71),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
