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
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
            title: Text(widget.box.name),
            subtitle: Text(widget.box.id.toString()),
            value: widget.box.attended,
            onChanged: (bool? value) {
              setState(() {
                widget.box.attended = value!;
              });
            },
          );
  }
}
