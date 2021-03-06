import 'dart:io';

import 'package:fast_food/screens/Login/LoginScreen.dart';
import 'package:fast_food/screens/Login/WelcomeScreen.dart';
import 'package:fast_food/screens/TabsScreen.dart';
import 'package:fast_food/screens/Main/WeeklyOverview.dart';
import 'package:fast_food/screens/Main/RecipeDetails.dart';
import 'package:fast_food/screens/Main/NutrientSelectionScreen.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/screens/recipe_detail.dart';
import 'package:fast_food/screens/weekly_meal_plan_overview.dart';
import 'package:fast_food/screens/testing_grounds.dart';
import 'package:fast_food/screens/GroceryList/GroceryListScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();

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
          primaryColor: Colors.green,
          unselectedWidgetColor: Colors.green),
      initialRoute: '/LoginScreen',
      routes: {
        '/recipe_detail': (context) => recipe_detail(),
        '/weekly_meal_plan_overview': (context) => weekly_meal_plan_overview(),
        // '/testing_grounds': (context) => testing_grounds(),
        '/WeeklyOverview': (context) => WeeklyOverview(),
        '/NutrientSelectionScreen': (context) => NutrientSelectionScreen(),
        '/MainPageScreen': (context) => MainPageScreen(),
        '/RecipeDetails': (context) => RecipeDetails(),
        '/TabsScreen': (context) => TabsScreen(),
        '/GroceryList': (context) => GroceryList(),
        '/LoginScreen': (context) => LoginScreen(),
      },
    );
  }
}
