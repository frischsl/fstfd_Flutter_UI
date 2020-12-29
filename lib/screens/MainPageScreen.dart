import 'dart:ffi';

import 'package:fast_food/components/CreateNewMealPlanBtn.dart';
import 'package:fast_food/components/PreviousMealPlanBtn.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'WeeklyOverview.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Let's get started.",
          style: cardTextStyleTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                CreateNewMealPlanBtn(),
                SizedBox(
                  height: 8.0,
                ),
                PreviousMealPlanBtn(
                  title: "Carby Body",
                  subParams: "100g Carbs, 0g Fat",
                  icon: Icon(Icons.alarm_off),
                ),
                PreviousMealPlanBtn(
                  title: "Test",
                  subParams: "Params",
                  icon: Icon(Icons.archive),
                ),
                PreviousMealPlanBtn(
                  title: "Test",
                  subParams: "Params",
                  icon: Icon(Icons.add_circle_outline),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.77,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5, //MacroNutrientBuilderList.length ?? 1,
                    itemBuilder: (context, index) {
                      return PreviousMealPlanBtn(
                        title: "Pizza Boy",
                        subParams: "100g Sat. Fat",
                        icon: Icon(Icons.local_pizza),
                      );
                      // return MacroNutrientBuilderList[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              {}
              break;

            case 1:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeeklyOverview(
                      nutritionalParams: {}, // TODO: This will have to be the most recent meal plan
                    ),
                  ),
                );
              }
              break;

            case 2:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPageScreen(),
                  ),
                );
              }
              break;

            case 3:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPageScreen(),
                  ),
                );
              }
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.green,
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Create",
              style: TextStyle(color: Colors.green),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu,
              color: Colors.green,
            ),
            title: Text(
              "Meal Plan",
              style: TextStyle(color: Colors.green),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            title: Text(
              "Grocery",
              style: TextStyle(color: Colors.green),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            title: Text(
              "Social",
              style: TextStyle(color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
