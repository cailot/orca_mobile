import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/api/api.dart';
import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/model/student_data.dart';
import 'package:flutter_first_hello_world/widget/student_widget.dart';

class AttendListPage extends StatefulWidget {
  const AttendListPage({
    super.key,
    required this.box,
  });

  final ClazzData box;

  @override
  State<AttendListPage> createState() => _AttendListPageState();
}

class _AttendListPageState extends State<AttendListPage> {
  List<StudentData> _studentList = <StudentData>[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    API.getAttendList(widget.box.id).then((studentList) {
      setState(() {
        _studentList = studentList;
        _isLoading = false;
      });
      // print('--- $_studentList');
    });
  }

  @override
  Widget build(BuildContext context) {
    // double hWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isLoading ? 'Loading....' : widget.box.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              List<Map<String, dynamic>> data = [];
              for (var i = 0; i < _studentList.length; i++) {
                Map<String, dynamic> statuses = {
                  _studentList[i].id.toString(): _studentList[i].status,
                };
                data.add(statuses);
                // print(
                //   '${_studentList[i].id} - ${_studentList[i].studentId} - ${_studentList[i].status}',
                // );
              }
              // print(data);
              API.updateAttend(data).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value,
                      textAlign: TextAlign.center,
                    ),
                    duration: const Duration(seconds: 3),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.deepPurple,
                  ),
                );
              });

              // post data to API
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _studentList.length,
        itemBuilder: (context, index) {
          return StudentWidget(
            box: _studentList[index],
            index: index,
            onChanged: (int index, String status) {
              setState(() {
                _studentList[index].status = status;
              });
            },
          );
        },
      ),
    );
  }
}
