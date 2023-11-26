import 'package:flutter/material.dart';
import 'package:flutter_james_an_college/authentication/login.dart';
import 'package:flutter_james_an_college/pages/profile_page.dart';
import 'package:flutter_james_an_college/pages/clazz_list_page.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  List<Widget> screens = [
    const ClazzListPage(teacherId: 1),
    ProfilePage(teacherId: 1),
    LoginPage()
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.subject),
            label: 'Class List',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
           NavigationDestination(
            icon: Icon(Icons.logout),
            label: 'Sign Out',
          ),
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int value) {
          setState(() {
            if(value == 2){ // back to login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            }
            currentPage = value;
          });
        },
      ),
      body: screens.elementAt(currentPage),
    );
  }
}
