import 'dart:convert';

import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/RecipeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';

import '../constants.dart';

class testing_grounds extends StatefulWidget {
  final weekday;
  final indexAdd;

  const testing_grounds({Key key, this.weekday, this.indexAdd})
      : super(key: key);
  @override
  _testing_groundsState createState() => _testing_groundsState();
}

class _testing_groundsState extends State<testing_grounds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Monday",
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.27,
                maxHeight: MediaQuery.of(context).size.height * 0.39,
                minWidth: double.infinity,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, //snapshot.data.recipes.length,
                itemBuilder: (context, index) {
                  // final recipe = snapshot.data.results[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      decoration: BoxDecoration(
                          // color: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        index.toString(),
                      ),
                      // child: RecipeCard(
                      //   recipe: recipe,
                      // ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
