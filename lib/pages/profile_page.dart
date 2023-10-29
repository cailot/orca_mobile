import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/core/constants.dart';
import 'package:flutter_first_hello_world/core/notifiers.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/yeah.png'),
          ),
          SizedBox(
            height: kDouble10,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Jin Seo'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('jin@seo.com'),
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('www.jin.com'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDarkMode.value = !isDarkMode.value;
        },
        child: ValueListenableBuilder(valueListenable: isDarkMode, builder: (context, isDark, child) {
          if(isDark){
            return const Icon(Icons.light_mode);
          }else{
            return const Icon(Icons.dark_mode);
          }
        },),
      )
    );
  }
}
