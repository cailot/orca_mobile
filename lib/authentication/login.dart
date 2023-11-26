import 'package:flutter/material.dart';
import 'package:flutter_james_an_college/api/api.dart';
import 'package:flutter_james_an_college/core/constants.dart';
import 'package:flutter_james_an_college/widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //bool _isLoading = false;

  void loginTry() {
    Map<String, String> parameters = {
      'user_email': _emailController.text.trim(),
      'user_password': _passwordController.text.trim()
    };

    API.loginTeacher(parameters).then((value) {
      if (value == 'Login Success') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WidgetTree(),
          ),
        );
      } else {
        setState(() {
          //   _isLoading = false;
        });
      }
      setState(() {
        _emailController.clear();
        _passwordController.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/icon.png',
                height: 200,
              ),
              const SizedBox(
                height: kDouble10,
              ),
              Text(
                'Attendance System',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: kDouble50,
              ),
              Text(
                'Please sign in to your account',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: kDouble20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(10),
        
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(10),
        
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        icon: Icon(
                          Icons.password,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: kDouble50,
              ),
              GestureDetector(
                onTap: () {
                  loginTry();
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 125),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: kDouble30,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        ' Contact Admin',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]
                )


            ],
          ),
        ),
      )),
    );
  }
}
