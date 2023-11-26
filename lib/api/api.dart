import 'dart:convert';

import 'package:flutter_james_an_college/model/clazz_data.dart';
import 'package:flutter_james_an_college/model/student_data.dart';
import 'package:flutter_james_an_college/model/teacher_data.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class API {
  // static const kHost = 'http://10.1.1.33:8080/api/';
  static const kHost = 'http://127.0.0.1/8080/api/';
  static const kClassList = '${kHost}clazzList/';
  static const kAttendList = '${kHost}attendList/';
  static const kUpdateAttend = '${kHost}updateAttend';
  static const kGetTeacher = '${kHost}getTeacher/';
  static const kUpdateTeacher = '${kHost}updateTeacher/';
  static const kteacherLogin = '${kHost}teacherLogin/';
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
      print(e.toString());
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
      final response = await http.put(
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

  // retrieve Teacher
  static Future<TeacherData> getTeacher(int teacherId) async {
    try {
      final response = await http.get(
        Uri.parse(
          API.kGetTeacher + teacherId.toString(),
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final TeacherData teacher = TeacherData.fromJson(responseBody);
        return teacher;
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${response.statusCode} - Please try again',
        );
        throw Exception('Failed to load teacher');
      }
    } catch (e) {
      // print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      throw Exception('Failed to load teacher');
    }
  }

  // update Teacher
  static Future<String> updateTeacher(Map<String, dynamic> teacher) async {
    try {
      String jsonData = jsonEncode(teacher);
      final response = await http.put(
        headers: {"Content-Type": "application/json"},
        body: jsonData,
        Uri.parse(
          API.kUpdateTeacher,
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

  // login Teacher
  static Future<String> loginTeacher(Map<String, dynamic> info) async {
    try {
      String jsonData = jsonEncode(info);
      final response = await http.put(
        headers: {"Content-Type": "application/json"},
        body: jsonData,
        Uri.parse(
          API.kteacherLogin,
        ),
      );
      if (response.statusCode == 200) {
        String resMessage = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: 'User Login Success',
        );
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
