import 'dart:convert';

import 'package:fast_food/Models/RecipeInformation.dart';
import 'package:fast_food/components/RecipeInstructions.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;

class RecipeDetails extends StatefulWidget {
  final int id;

  const RecipeDetails({Key key, this.id}) : super(key: key);
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with TickerProviderStateMixin {
  bool isRecipeLiked =
      false; // TODO: This value will have to bet set on a by user basis
  List<Tab> tabList = List();
  TabController tabController;

  Image image;
  String title;
  double rating;
  int servings;
  int readyInMinutes;
  int healthScore;
  double pricePerServing;
  List<String> dishTypes;
  List<ExtendedIngredients> extendedIngredients;
  List<Nutrients> nutrients;

  Future<RecipeInformation> futureRecipeInformation;
  int id;

  @override
  void initState() {
    tabList.add(new Tab(
      text: 'Nutrition',
    ));
    tabList.add(new Tab(
      text: 'Ingredients',
    ));
    tabList.add(new Tab(
      text: 'Instructions',
    ));
    tabController = new TabController(vsync: this, length: tabList.length);

    futureRecipeInformation = fetchRecipeById(324694);

    super.initState();
  }

  Future<RecipeInformation> fetchRecipeById(int id) async {
    id = 324694; // TODO: DELETE
    String baseUrl = "https://api.spoonacular.com/recipes/${id}/information";

    final response =
        await http.get("${baseUrl}?apiKey=${s_apikey}&includeNutrition=true");

    if (response.statusCode == 200) {
      print("LKJSDHLKDJSHFLKSDJHFLKSJDHLKSDJH");
      // print("Below is our http response: ");
      // print(response.body);
      // RecipeInformation ri = new RecipeInformation();
      // ri.title = json.decode(response.body)["title"];

      return RecipeInformation.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: FutureBuilder<RecipeInformation>(
        future: futureRecipeInformation,
        builder: (context, snapshot) {
          print("snapshot: ${snapshot.data.toString()}");
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            print("snpashot below:");
            print(snapshot.data.title);
            title = snapshot.data.title;
            image = Image.network(snapshot.data.image);
            servings = snapshot.data.servings;
            rating = snapshot.data.spoonacularScore / 20;
            readyInMinutes = snapshot.data.readyInMinutes;
            nutrients = snapshot.data.nutrition.nutrients;
            extendedIngredients = snapshot.data.extendedIngredients;

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      image ??
                          Image.network(
                              "https://spoonacular.com/recipeImages/716429-556x370.jpg"),
                      SafeArea(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: RaisedButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                // TODO: Save user preference OR do this on back
                                setState(() {
                                  isRecipeLiked = !isRecipeLiked;
                                });
                              },
                              color: Colors.orange[400],
                              elevation: 8.0,
                              child: (isRecipeLiked)
                                  ? Icon(
                                      LineIcons.heart,
                                      color: Colors.red,
                                      size: 20.0,
                                    )
                                  : Icon(
                                      LineIcons.heart_o,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                            )),
                      ),
                      SafeArea(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: RaisedButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                // TODO: Go back & check for changes
                              },
                              color: Colors.orange[400],
                              elevation: 8.0,
                              child: Icon(
                                LineIcons.arrow_left,
                                color: Colors.white,
                                size: 23.0,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.66,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 0.0),
                          child: Text(
                            title ?? "NULL",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 14.0, 18.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              "\$${pricePerServing}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  letterSpacing: 1.5,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 0.0),
                    child: Text(
                      "${readyInMinutes} minutes · ${servings} servings",
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TabBar(
                          controller: tabController,
                          tabs: tabList,
                          indicatorColor: Colors.orange,
                          indicatorSize: TabBarIndicatorSize.label),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: Container(
                      height: 500.0,
                      width: double.infinity,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: nutrients.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${nutrients[index].title}  |  ${nutrients[index].amount}${nutrients[index].unit}  |  ${nutrients[index].percentOfDailyNeeds}%"),
                                            Divider(
                                              color: Colors.orange,
                                              thickness: 1.0,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: extendedIngredients.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${extendedIngredients[index].original}"),
                                            Divider(
                                              color: Colors.orange,
                                              thickness: 1.0,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          RecipeInstructions(
                            id: widget.id,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
