import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/model/student_data.dart';
import 'package:flutter_first_hello_world/widget/student_widget.dart';

class ClazzDetailPage extends StatefulWidget {
  const ClazzDetailPage({
    super.key,
    required this.box,
  });

  final ClazzData box;

  @override
  State<ClazzDetailPage> createState() => _ClazzDetailPageState();
}

class _ClazzDetailPageState extends State<ClazzDetailPage> {
  double fontSize = 10.0;

  @override
  Widget build(BuildContext context) {
    // double hWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.box.name,
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
        itemCount: widget.box.number,
        itemBuilder: (context, index) {
          // return CheckboxListTile(
          //   title: Text('James Pham ${index + 1}'),
          //   subtitle: const Text('130365',),
          //   value: _isSelected[index],
          //   onChanged: (bool? value) {
          //     setState(() {
          //       _isSelected[index] = value!;
          //     });
          //   },
          // );
          return StudentWidget(
            box: StudentData(
              id: index,
              name: 'James Ahn ${index + 1}',
              attended: true,
            ),
            index: index,
          );
        },
      ),
    );
  }
}
