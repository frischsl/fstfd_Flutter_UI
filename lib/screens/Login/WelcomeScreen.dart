/*
Inspiration taken from the design of TheAlphamerc, see repo here:
https://github.com/TheAlphamerc/flutter_login_signup
*/

import 'package:fast_food/screens/Login/LoginScreen.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/services/DatabaseProvider.dart';
import 'package:flutter/material.dart';

import 'RegisterScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff9cd49f), Colors.green[700]])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Text(
              "FstFd",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 44.0,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
              ),
            ),
            SizedBox(height: 35.0),
            InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
