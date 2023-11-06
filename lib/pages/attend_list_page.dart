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
    API.getAttendList(widget.box.id, '2021-10-01').then((studentList) {
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
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Attendance Roll Saved'),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.deepPurple,
                ),
              );
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
            box: StudentData(
              id: _studentList[index].id,
              attendDate: _studentList[index].attendDate,
              status: _studentList[index].status,
              studentId: _studentList[index].studentId,
              studentName: _studentList[index].studentName,
              // name: _studentList[index].name,
              // attended: true,
            ),
            index: index,
          );
        },
      ),
    );
  }
}
