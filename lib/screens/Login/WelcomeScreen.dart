/*
Inspiration taken from the design of TheAlphamerc, see repo here:
https://github.com/TheAlphamerc/flutter_login_signup
*/

import 'package:fast_food/screens/Login/LoginScreen.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/services/DatabaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'RegisterScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Image img;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //     alignment: Alignment.center,
          //     image: NetworkImage(
          //       "https://image.shutterstock.com/image-photo/wooden-spoon-ingredients-on-old-600w-318469892.jpg",
          //     ),
          //     fit: BoxFit.cover),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green[200], Colors.green[800]]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Text(
              "Pasta",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 150.0,
                color: Colors.white,
                fontFamily: 'TheBlackBox',
                fontWeight: FontWeight.bold,
                letterSpacing: 8.0,
              ),
            ),
            Text("By: Zac and Sam"),
            SizedBox(height: 10.0),
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
            SizedBox(
              height: 20.0,
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
