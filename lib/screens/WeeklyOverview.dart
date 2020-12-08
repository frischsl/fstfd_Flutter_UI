import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast_food/constants.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/components/RecipeCard.dart';

class WeeklyOverview extends StatefulWidget {
  @override
  _WeeklyOverviewState createState() => _WeeklyOverviewState();
}

class _WeeklyOverviewState extends State<WeeklyOverview> {
  Future<RecipeList> futureRecipe;
  @override
  void initState() {
    super.initState();
    futureRecipe = fetchComplexRecipeList();
  }

  Future<RecipeList> fetchComplexRecipeList() async {
    final response = await http.get(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&query=pasta&maxFat=25&number=4');

    if (response.statusCode == 200) {
      return RecipeList.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.add, color: Colors.black),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Eat pasta, feel good",
          style: cardTextStyleTitle,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Test",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            FutureBuilder<RecipeList>(
              future: futureRecipe,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = snapshot.data.recipes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                                // color: Colors.orangeAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: RecipeCard(
                              recipe: recipe,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
