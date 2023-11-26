import 'package:flutter/material.dart';
import 'package:flutter_james_an_college/api/api.dart';
import 'package:flutter_james_an_college/core/constants.dart';
import 'package:flutter_james_an_college/model/teacher_data.dart';

// ignore: must_be_immutable
class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key, required this.box});

  final TeacherData box;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool showPassword = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _vitController = TextEditingController();

  var updatedInfo = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.box.firstName;
    _lastNameController.text = widget.box.lastName;
    _passwordController.text =
        '1234'; //'**********';//widget.box.password ?? '**********';
    _phoneController.text = widget.box.phone;
    _addressController.text = widget.box.address;
    _vitController.text = widget.box.vit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Edit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, updatedInfo);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              updatedInfo = {
                'id': widget.box.id,
                'firstName': _firstNameController.text.trim(),
                'lastName': _lastNameController.text.trim(),
                'password': _passwordController.text.trim(),
                'phone': _phoneController.text.trim(),
                'address': _addressController.text.trim(),
                'vit': _vitController.text.trim()
              };
              API.updateTeacher(updatedInfo).then((value) {
                //print(value);
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
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(kDouble10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: kDouble20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('images/teacher.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          // color: Colors.blue,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kDouble30,
              ),
              // first name
              buildTextField(
                  _firstNameController, 'First Name', widget.box.firstName),

              // last name
              buildTextField(
                  _lastNameController, 'Last Name', widget.box.lastName),

              // password
              buildPasswordField(_passwordController, 'Password', '********'),

              // phone
              buildTextField(_phoneController, 'Phone', widget.box.phone),

              // address
              buildTextField(_addressController, 'Address', widget.box.address),

              // VIT/WWCC
              buildTextField(_vitController, 'VIT/WWCC', widget.box.vit),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String labelText, String contents) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kDouble20, 0, kDouble20, kDouble30),
      child: TextField(
        //obscureText: isPassword ? true : showPassword,
        controller: controller,
        decoration: InputDecoration(
          // suffixIcon: isPassword
          //     ? IconButton(
          //         onPressed: () {
          //           setState(() {
          //             showPassword = !showPassword;
          //           });
          //         },
          //         icon: const Icon(Icons.remove_red_eye),
          //         color: Colors.grey,
          //       )
          //     : null,
          contentPadding: const EdgeInsets.only(bottom: kDouble5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget buildPasswordField(
      TextEditingController controller, String labelText, String contents) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kDouble20, 0, kDouble20, kDouble30),
      child: TextField(
        obscureText: !showPassword,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: showPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: Colors.grey,
                ),
          contentPadding: const EdgeInsets.only(bottom: kDouble5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
