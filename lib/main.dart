import 'package:flutter/material.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/myspace/myspace_screen.dart';
// import 'screens/explore/explore_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/create_trip/own_plan_screen.dart';
import 'screens/create_trip/trip_form_screen.dart';
import 'screens/profile/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Planner',
      theme: ThemeData(
        primaryColor: const Color(0xFF006A71),
        scaffoldBackgroundColor: const Color(0xFFF2EFE7),
        fontFamily: 'Roboto', // Optional: custom font
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) =>  DashboardScreen(username: "Khushi"),
        '/mySpace': (context) =>  MySpaceScreen(),
        // '/explore': (context) =>  ExploreScreen(),
         '/profile': (context) => ProfilePage(),
        '/ownPlan': (context) => OwnPlanPage(),
        '/tripForm': (context) =>  TripFormScreen(),
        '/setting': (context) =>  SettingsPage(),
      },
    );
  }
}
