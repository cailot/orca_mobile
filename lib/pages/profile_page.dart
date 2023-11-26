import 'package:flutter/material.dart';
import 'package:flutter_james_an_college/api/api.dart';
import 'package:flutter_james_an_college/core/constants.dart';
import 'package:flutter_james_an_college/model/teacher_data.dart';
import 'package:flutter_james_an_college/pages/profile_edit_page.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
    required this.teacherId,
  });
  int teacherId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<TeacherData> fetchTeacherInfo(int teacherId) async {
    try {
      final teacher = await API
          .getTeacher(teacherId); // Call API method to get teacher info
      return teacher;
    } catch (e) {
      throw Exception('Failed to load teacher info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeacherData>(
      future: fetchTeacherInfo(widget.teacherId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Loading
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          // once data is fetched, display the data
          final TeacherData teacher = snapshot.data ??
              TeacherData(
                  id: widget.teacherId,
                  firstName: '',
                  lastName: '',
                  phone: '',
                  address: '',
                  vit: '',
                  email: '');
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.deepPurple,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileEditPage(
                            box: teacher,
                          );
                        },
                      ),
                    ).then((value) {
                      setState(() {
                        teacher.firstName = value['firstName'] ?? '';
                        teacher.lastName = value['lastName'] ?? '';
                        teacher.phone = value['phone'] ?? '';
                        teacher.address = value['address'] ?? '';
                        teacher.vit = value['vit'] ?? '';
                      });
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(kDouble20),
              child: Column(
                children: [
                  const SizedBox(
                    height: kDouble40,
                  ),
                  const CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('images/teacher.png'),
                  ),
                  const SizedBox(
                    height: kDouble20,
                  ),
                  buildListTile(
                      Icons.person, '${teacher.firstName} ${teacher.lastName}'),
                  buildListTile(Icons.phone_android, teacher.phone),
                  buildListTile(Icons.home, teacher.address),
                  buildListTile(Icons.credit_card, teacher.vit),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildListTile(IconData icon, String titleText) {
    return Padding(
      padding: const EdgeInsets.only(top: kDouble20),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 18,
            //fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
