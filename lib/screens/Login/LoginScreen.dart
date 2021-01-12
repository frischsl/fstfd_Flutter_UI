/*
Inspiration taken from the design of TheAlphamerc, see repo here:
https://github.com/TheAlphamerc/flutter_login_signup
*/

import 'package:fast_food/constants.dart';
import 'package:fast_food/screens/Login/RegisterScreen.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/screens/TabsScreen.dart';
import 'package:fast_food/services/DatabaseProvider.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    ],
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () async {
                      kUser = await FstFdAPI.Login(
                          emailController.text, passwordController.text);

                      print(kUser);
                      if (kUser == null) {
                        Fluttertoast.showToast(
                            msg: "Incorrect email or password",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.cancel();
                        DatabaseProvider.db.addUserToDatabase(kUser);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabsScreen()));
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
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Register',
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
