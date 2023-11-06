import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/api/api.dart';
import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/widget/clazz_widget.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class ClazzListPage extends StatelessWidget {
  const ClazzListPage({super.key, required this.teacherId});
  final int teacherId;

  checkClazzList(int clazzId) async {
    try {
      var response = await http.get(
        Uri.parse(API.CLASS_LIST + clazzId.toString()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        for (var item in responseBody) {
          print(item);
        }
        // print(responseBody);
        Fluttertoast.showToast(
          msg: 'responseBody',
        );
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Class List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                checkClazzList(1);
              },
              child: const Text(
                'click me',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClazzWidget(
              box: ClazzData(
                id: 1,
                name: 'Rocket',
                description: '..Rocket..',
                grade: 'p1',
                number: 10,
                day: 'Friday',
              ),
            ),
            ClazzWidget(
              box: ClazzData(
                id: 4,
                name: 'Yeah',
                description: 'Yeah...',
                grade: 'p4',
                number: 9,
                day: 'Monday',
              ),
            ),
            ClazzWidget(
              box: ClazzData(
                id: 4,
                name: 'Space',
                description: 'Space...',
                grade: 'p2',
                number: 6,
                day: 'Wednesday',
              ),
            ),
            ClazzWidget(
              box: ClazzData(
                id: 4,
                name: 'Travel',
                description: 'Travel...',
                grade: 'p3',
                number: 5,
                day: 'Thursday',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
