import 'dart:convert';

import 'package:fast_food/components/RecipeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';

import '../constants.dart';

class testing_grounds extends StatefulWidget {
  final nutritionalParams;

  const testing_grounds({Key key, this.nutritionalParams}) : super(key: key);
  @override
  _testing_groundsState createState() => _testing_groundsState();
}

class _testing_groundsState extends State<testing_grounds> {
  Future<ComplexSearchWithFullParams> futureRecipe;
  String queryParams = "";
  List<int> recipeIds = [];
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    print("Before the magic");
    if (false && widget.nutritionalParams.toString() != "{}") {
      print("Whoops the magic");
      widget.nutritionalParams.forEach((k, v) => queryParams += "${k}=${v}&");
      queryParams = queryParams.substring(0, queryParams.length - 1);
    }
    futureRecipe = fetchComplexSearchWithFullParamsList();
    print(widget.nutritionalParams);
  }

  Future<ComplexSearchWithFullParams>
      fetchComplexSearchWithFullParamsList() async {
    // instructionsRequired, addRecipeNutrition
    String baseUrl = "";
    if (widget.nutritionalParams == {}) {
      baseUrl =
          "https://api.spoonacular.com/recipes/random?apiKey=${s_apikey}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=1";
    } else {
      baseUrl = "";
      // "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&${queryParams}&number=21";
      // "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&${queryParams}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=1";
    }

    baseUrl =
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=1";

    final response = await http.get("${baseUrl}");

    print("Response: ${jsonDecode(response.body)}");

    if (response.statusCode == 200) {
      return ComplexSearchWithFullParams.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<ComplexSearchWithFullParams>(
          future: futureRecipe,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data.results[0]);
              // print(snapshot.data.);
              return Container(
                width: 100.0,
                height: 100.0,
                color: Colors.green,
                child: RecipeCard(
                  recipe: snapshot.data.results[0],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
