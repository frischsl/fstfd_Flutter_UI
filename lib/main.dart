import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/MainPageScreen.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/NutrientSelectionScreen.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/RecipeDetails.dart';
import 'package:fast_food/screens/TabsScreen.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/WeeklyOverview.dart';
import 'package:fast_food/screens/recipe_detail.dart';
import 'package:fast_food/screens/weekly_meal_plan_overview.dart';
import 'package:fast_food/screens/testing_grounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          primaryColor: Colors.green,
          unselectedWidgetColor: Colors.green),
      initialRoute: '/TabsScreen',
      routes: {
        '/recipe_detail': (context) => recipe_detail(),
        '/weekly_meal_plan_overview': (context) => weekly_meal_plan_overview(),
        '/testing_grounds': (context) => testing_grounds(),
        '/WeeklyOverview': (context) => WeeklyOverview(),
        '/NutrientSelectionScreen': (context) => NutrientSelectionScreen(),
        '/MainPageScreen': (context) => MainPageScreen(),
        '/RecipeDetails': (context) => RecipeDetails(),
        '/TabsScreen': (context) => TabsScreen(),
      },
    );
  }
}
