import 'package:flutter/material.dart';
import 'package:tourism_app/Pages/carbon_screen1.dart';
import 'package:tourism_app/Pages/home_page.dart';
import 'package:tourism_app/Pages/profile_page.dart';
import 'package:tourism_app/Pages/shop/stores_page.dart';
import 'package:tourism_app/Pages/volunteer_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> pages = [
    const HomePage(),
    const CarbonFootprintCalculator(),
    const VolunteerPage(),
    const StoresPage(),
    const ProfilePage()
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        selectedItemColor: Colors.black, // For selected item color
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate_rounded,
            ),
            label: "Calculator",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.volunteer_activism,
            ),
            label: "Volunteering",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
