import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/pages/home_page.dart';
import 'package:flutter_first_hello_world/pages/profile_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  List<Widget> screens = [
    const HomePage(),
    const ProfilePage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
      body: screens.elementAt(currentPage),
    );
  }
}
