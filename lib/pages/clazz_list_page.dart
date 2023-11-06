import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/api/api.dart';
import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/widget/clazz_widget.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class ClazzListPage extends StatefulWidget {
  const ClazzListPage({super.key, required this.teacherId});
  final int teacherId;

  @override
  State<ClazzListPage> createState() => _ClazzListPageState();
}

class _ClazzListPageState extends State<ClazzListPage> {
  List<ClazzData> _clazzList = <ClazzData>[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    API.getClazzList(widget.teacherId).then((clazzList) {
      setState(() {
        _clazzList = clazzList;
        _isLoading = false;
      });
      // print(clazzList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isLoading ? 'Loading....' : 'Class List',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: _clazzList.length,
        itemBuilder: (context, index) {
          return ClazzWidget(
            box: _clazzList[index],
          );
        },
      ),
    );
  }
}
