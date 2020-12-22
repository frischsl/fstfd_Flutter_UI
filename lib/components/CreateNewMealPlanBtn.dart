import 'package:fast_food/screens/NutrientSelectionScreen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CreateNewMealPlanBtn extends StatefulWidget {
  @override
  _CreateNewMealPlanBtnState createState() => _CreateNewMealPlanBtnState();
}

class _CreateNewMealPlanBtnState extends State<CreateNewMealPlanBtn> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textColor: Colors.white,
        color: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NutrientSelectionScreen(),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.width * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Create",
                style: mainPageCreateBtnTextStyle,
              ),
              Icon(Icons.add)
            ],
          ),
        ));
  }
}
