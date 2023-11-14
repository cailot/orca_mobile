import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/core/notifiers.dart';
import 'package:flutter_first_hello_world/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Orca Demo',
          theme: ThemeData(
            //brightness: isDark ? Brightness.dark : Brightness.light,
            useMaterial3: true,
          ),
          home: const WidgetTree(),
        );
      },
    );
  }
}
