import 'package:fast_food/screens/MainPageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast_food/constants.dart';
// import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/components/RecipeCard.dart';

class WeeklyOverview extends StatefulWidget {
  final nutritionalParams;

  const WeeklyOverview({Key key, this.nutritionalParams}) : super(key: key);
  @override
  _WeeklyOverviewState createState() => _WeeklyOverviewState();
}

class _WeeklyOverviewState extends State<WeeklyOverview> {
  Future<ComplexSearchWithFullParams> futureRecipe;
  String queryParams = "";
  List<int> recipeIds = [];
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    print("Before nutritionalParams: ${widget.nutritionalParams.toString()}");
    if (widget.nutritionalParams.toString() != "{}") {
      widget.nutritionalParams.forEach((k, v) => queryParams += "${k}=${v}&");
      queryParams = queryParams.substring(0, queryParams.length - 1);
    }
    futureRecipe = fetchComplexRecipeList();
    print(widget.nutritionalParams);
  }

  Future<ComplexSearchWithFullParams> fetchComplexRecipeList() async {
    // instructionsRequired, addRecipeNutrition
    String baseUrl = "";
    if (widget.nutritionalParams == {}) {
      baseUrl =
          "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=21";
    } else {
      baseUrl =
          "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&${queryParams}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=21";
    }

    print("${baseUrl}");

    final response = await http.get("${baseUrl}");
    print(response.body);
    if (response.statusCode == 200) {
      return ComplexSearchWithFullParams.fromJson(jsonDecode((response.body)));
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
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                Text(
                  "Sunday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index];
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
                Text(
                  "Monday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 3];
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
                Text(
                  "Tuesday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 6];
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
                Text(
                  "Wednesday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 9];
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
                Text(
                  "Thursday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 12];
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
                Text(
                  "Friday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 15];
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
                Text(
                  "Saturday",
                  style: weeklyOverviewWeekdayStyle,
                ),
                FutureBuilder<ComplexSearchWithFullParams>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          maxHeight: MediaQuery.of(context).size.height * 0.39,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //snapshot.data.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data.results[index + 18];
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPageScreen(),
                  ),
                );
              }
              break;

            case 1:
              {}
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
