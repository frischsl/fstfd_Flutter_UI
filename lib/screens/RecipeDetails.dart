import 'dart:convert';

import 'package:fast_food/Models/RecipeInformation.dart';
import 'package:fast_food/components/RecipeInstructions.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';

class RecipeDetails extends StatefulWidget {
  final Results recipe;

  const RecipeDetails({Key key, this.recipe}) : super(key: key);
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with TickerProviderStateMixin {
  bool isRecipeLiked =
      false; // TODO: This value will have to bet set on a by user basis
  List<Tab> tabList = List();
  TabController tabController;

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

    // futureRecipeInformation = fetchRecipeById(widget.id);

    super.initState();
  }

  Future<RecipeInformation> fetchRecipeById(int id) async {
    String baseUrl = "https://api.spoonacular.com/recipes/${id}/information";

    final response =
        await http.get("${baseUrl}?apiKey=${s_apikey}&includeNutrition=true");

    if (response.statusCode == 200) {
      return RecipeInformation.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Stack(
              children: [
                Image.network(
                      widget.recipe.image,
                      scale: 0.7,
                    ) ??
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
                        elevation: 28.0,
                        child: (isRecipeLiked)
                            ? Icon(
                                LineIcons.heart,
                                color: Colors.red[400],
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
                          Navigator.pop(context);
                        },
                        color: Colors.orange[400],
                        elevation: 28.0,
                        child: Icon(
                          LineIcons.arrow_left,
                          color: Colors.white,
                          size: 23.0,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.66,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 0.0),
                  child: Text(
                    widget.recipe.title ?? "NULL",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 14.0, 18.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.08,
                  decoration: BoxDecoration(
                    color: (widget.recipe.pricePerServing != null)
                        ? Colors.green
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "\$${(widget.recipe.pricePerServing / 100).toStringAsFixed(2)}",
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
              "${widget.recipe.readyInMinutes} minutes · ${widget.recipe.servings} servings",
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          // Text("${snapshot.data.summary ?? ""}"),
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
              width: double.infinity,
              height: 400.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  widget.recipe.nutrition.nutrients.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${widget.recipe.nutrition.nutrients[index].title}  |  ${widget.recipe.nutrition.nutrients[index].amount}${widget.recipe.nutrition.nutrients[index].unit}  |  ${widget.recipe.nutrition.nutrients[index].percentOfDailyNeeds}%"),
                                    Divider(
                                      color: Colors.orange,
                                      thickness: 1.0,
                                    )
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  widget.recipe.nutrition.ingredients.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${widget.recipe.nutrition.ingredients[index].amount} ${widget.recipe.nutrition.ingredients[index].unit} - ${widget.recipe.nutrition.ingredients[index].name}"),
                                    Divider(
                                      color: Colors.orange,
                                      thickness: 1.0,
                                    )
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: widget
                                  .recipe.analyzedInstructions[0].steps.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${widget.recipe.analyzedInstructions[0].steps[index].number}. ${widget.recipe.analyzedInstructions[0].steps[index].step}"),
                                    Divider(
                                      color: Colors.orange,
                                      thickness: 1.0,
                                    )
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  // RecipeInstructions(
                  //   id: widget.id,
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
