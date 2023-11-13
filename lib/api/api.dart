import 'dart:convert';

import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/model/student_data.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class API {
  static const kHost = 'http://127.0.0.1:8080/api/';
  // static const kHost =
  //     'http://crispy-space-garbanzo-g44pg7p9w643wp54-8080.app.github.dev/api/';
  static const kClassList = '${kHost}clazzList/';
  static const kAttendList = '${kHost}attendList/';
  static const kUpdateAttend = '${kHost}updateAttend';

  // retrieve Class List
  static Future<List<ClazzData>> getClazzList(int clazzId) async {
    try {
      final response = await http.get(
        Uri.parse(
          API.kClassList + clazzId.toString(),
        ),
      );
      if (response.statusCode == 200) {
        final List<ClazzData> clazzList = clazzDataFromJson(response.body);
        return clazzList;
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${response.statusCode} - Please try again',
        );
        return <ClazzData>[];
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      return <ClazzData>[];
    }
  }

  // retrieve Student List
  static Future<List<StudentData>> getAttendList(int clazzId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${API.kAttendList}$clazzId',
        ),
      );
      if (response.statusCode == 200) {
        final List<StudentData> studentList =
            studentDataFromJson(response.body);
        return studentList;
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${response.statusCode} - Please try again',
        );
        return <StudentData>[];
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      return <StudentData>[];
    }
  }

  // update attend status
  static Future<String> updateAttend(List<Map<String, dynamic>> data) async {
    try {
      String jsonData = jsonEncode(data);
      final response = await http.post(
        headers: {"Content-Type": "application/json"},
        body: jsonData,
        Uri.parse(
          API.kUpdateAttend,
        ),
      );
      if (response.statusCode == 200) {
        String resMessage = jsonDecode(response.body);
        return resMessage;
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${response.statusCode} - Please try again',
        );
        return response.body.toString();
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      return e.toString();
    }
  }
}
