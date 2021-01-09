import 'dart:ffi';

import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/CreateNewMealPlanBtn.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/PreviousMealPlanBtn.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MainPageScreen extends StatefulWidget {
  final Function(int) notifyParent;

  const MainPageScreen({Key key, this.notifyParent}) : super(key: key);
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
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
                CreateNewMealPlanBtn(
                  notifyParent: widget.notifyParent,
                ),
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
    );
  }
}
