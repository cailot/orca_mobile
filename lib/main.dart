import 'package:flutter/material.dart';
import 'package:flutter_james_an_college/authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noir Demo',
      theme: ThemeData(
        //brightness: isDark ? Brightness.dark : Brightness.light,
        useMaterial3: true,
      ),
     // home: const WidgetTree(),
      home: const LoginPage(),
    );
  }
}
