// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  String password = "";
  bool changedButton = false;

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.HomeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  // const ({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  height: 150,
                  fit: BoxFit.contain,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  textAlign: TextAlign.center,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 52.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter UserName", labelText: "UserName:"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password:"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be Empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 40.0,
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.blue,
                      //     onPrimary: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(32.0)),
                      //     minimumSize: Size(150, 50), //////// HERE
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, Routes.HomeRoute);
                      //   },
                      //   child: Text('Please Login'),
                      // )
                      Material(
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 10),
                        color: Colors.blue,
                        // shape: changedButton
                        //     ? BoxShape.circle
                        //     : BoxShape.rectangle,

                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changedButton ? 50 : 100,
                            alignment: Alignment.center,
                            child: changedButton
                                // ignore: prefer_const_constructors
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                // ignore: prefer_const_constructors
                                : Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
