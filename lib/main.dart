import 'package:fast_food/screens/recipe_detail.dart';
import 'package:fast_food/screens/weekly_meal_plan_overview.dart';
import 'package:fast_food/screens/testing_grounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/gBottomNavBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: Example(),
      initialRoute: '/testing_grounds',
      routes: {
        '/recipe_detail': (context) => recipe_detail(),
        '/weekly_meal_plan_overview': (context) => weekly_meal_plan_overview(),
        '/testing_grounds': (context) => testing_grounds(),
      },
    );
  }
}
