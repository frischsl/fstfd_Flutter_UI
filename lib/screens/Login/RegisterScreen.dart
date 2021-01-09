/*
Inspiration taken from the design of TheAlphamerc, see repo here:
https://github.com/TheAlphamerc/flutter_login_signup
*/

import 'package:fast_food/constants.dart';
import 'package:fast_food/screens/Login/LoginScreen.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/services/DatabaseProvider.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                        ),
                        Text("Back",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Text(
                    "FstFd",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 44.0,
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                    ),
                  ),
                  SizedBox(height: 35.0),
                  Column(
                    children: <Widget>[
                      _entryField("Email", controller: emailController),
                      _entryField("Password",
                          isPassword: true, controller: passwordController),
                      _entryField("Re-enter Password",
                          isPassword: true,
                          controller: reEnterPasswordController),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () async {
                      // validate entryfields
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text);
                      bool passwordsMatch = (passwordController.text ==
                              reEnterPasswordController.text)
                          ? true
                          : false;

                      bool passwordLength =
                          (passwordController.text.length >= 5) ? true : false;
                      // valid : register and redirect to login w/ toast
                      if (emailValid && passwordsMatch && passwordLength) {
                        // register
                        bool registered = await FstFdAPI.RegisterUser(
                            emailController.text, passwordController.text);

                        if (registered) {
                          // navigate
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                          // toast
                          Fluttertoast.showToast(
                              msg: "Successfully registered. Please login.",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "A user already exists with this email",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } else {
                        if (!emailValid) {
                          Fluttertoast.showToast(
                              msg: "Please enter a valid email",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (!passwordsMatch) {
                          Fluttertoast.showToast(
                              msg: "The passwords do not match",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (!passwordLength) {
                          Fluttertoast.showToast(
                              msg:
                                  "Password length must be at least 5 characters long",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff9cd49f), Colors.green[700]])),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _entryField(String title,
    {bool isPassword = false, TextEditingController controller}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  );
}
