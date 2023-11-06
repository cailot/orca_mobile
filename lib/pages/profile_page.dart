import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/core/constants.dart';
import 'package:flutter_first_hello_world/core/notifiers.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kDouble40,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/teacher.png'),
              ),
              SizedBox(
                height: kDouble20,
              ),
              ListTile(
                leading: Icon(Icons.fingerprint),
                title: Text('js12345'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('James Ahn'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('braybrook@jamesahn.com.au'),
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('0412 345 678'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('123 Main St, Melbourne, VIC 3000'),
              ),
              ListTile(
                leading: Icon(Icons.card_membership),
                title: Text('12345'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            isDarkMode.value = !isDarkMode.value;
          },
          child: ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, isDark, child) {
              if (isDark) {
                return const Icon(Icons.light_mode);
              } else {
                return const Icon(Icons.dark_mode);
              }
            },
          ),
        ));
  }
}
