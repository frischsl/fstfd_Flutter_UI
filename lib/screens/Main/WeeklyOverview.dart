import 'dart:collection';

import 'package:fast_food/components/Main/ShareScreen.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fast_food/constants.dart';
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/components/Main/WeekdayRecipes.dart';
import 'package:fast_food/screens/GroceryList/GroceryListScreen.dart';

class WeeklyOverview extends StatefulWidget {
  final mealPlanTitle;
  final nutritionalParams;
  final queryString;
  final Function(int) notifyParent;

  const WeeklyOverview(
      {Key key,
      this.nutritionalParams,
      this.notifyParent,
      this.queryString,
      this.mealPlanTitle})
      : super(key: key);
  @override
  _WeeklyOverviewState createState() => _WeeklyOverviewState();
}

class _WeeklyOverviewState extends State<WeeklyOverview> {
  Future<ComplexSearchWithFullParams> futureRecipe;
  String queryParams = "";
  List<int> recipeIds = [];
  List WeekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  ComplexSearchWithFullParams currentRecipes;
  String image;

  @override
  void initState() {
    super.initState();

    String baseUrl = (widget.queryString == null) ? "" : widget.queryString;
    futureRecipe = FstFdAPI.fetchComplexRecipeList(baseUrl);
    // print(widget.nutritionalParams);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.green,
            ),
            onPressed: () {
              if (image != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShareScreen(
                            title: widget.mealPlanTitle,
                            img: image,
                            mealPlanURL: widget.queryString,
                            type: "Meal Plan",
                          )),
                );
              }
            },
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.mealPlanTitle,
          style: cardTextStyleTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      currentRecipes = snapshot.data;
                      image = currentRecipes.results[0].image;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return WeekdayRecipes(
                            weekday: WeekDays[index],
                            indexAdd: index * 3,
                            recipes: snapshot.data.results,
                            mealPlanUrl: widget.queryString,
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Row(
          children: [
            SizedBox(
              width: 13.0,
            ),
            // Icon(
            //   Icons.add,
            //   size: 20.0,
            // ),
            Icon(
              FontAwesomeIcons.cartPlus,
              size: 25.0,
            ),
          ],
        ),
        elevation: 20.0,
        backgroundColor: Colors.green,
        onPressed: () {
          if (currentRecipes != null) {
            currentRecipes.results.forEach((recipe) {
              recipe.nutrition.ingredients.forEach((ingred) {
                if (ingredients.containsKey(ingred.name)) {
                  if (ingred.unit == ingredients[ingred.name].unit)
                    ingredients[ingred.name].amount += ingred.amount;
                  else if (ingredients
                      .containsKey("${ingred.name}_${ingred.unit}"))
                    ingredients["${ingred.name}_${ingred.unit}"].amount +=
                        ingred.amount;
                  else
                    ingredients["${ingred.name}_${ingred.unit}"] = ingred;
                } else {
                  ingredients[ingred.name] = ingred;
                }
              });
            });
          }
          widget.notifyParent(1);
        },
      ),
    );
  }
}
