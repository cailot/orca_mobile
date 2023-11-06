import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/model/student_data.dart';

class StudentWidget extends StatefulWidget {
  const StudentWidget({
    super.key,
    required this.box,
    required this.index,
  });

  final int index;
  final StudentData box;

  @override
  State<StudentWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.box.studentName),
      subtitle: Text(widget.box.studentId.toString()),
      secondary: const Icon(
        Icons.account_circle_rounded,
        color: Colors.purple,
      ),
      value: _isSelected,
      onChanged: (bool? value) {
        setState(() {
          _isSelected = value!;
          print('${widget.box.id} is $_isSelected');
        });
      },
    );
  }
}
