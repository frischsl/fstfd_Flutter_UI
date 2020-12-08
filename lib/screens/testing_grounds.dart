import 'package:fast_food/components/recipe_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast_food/constants.dart';

import 'package:line_icons/line_icons.dart';

class testing_grounds extends StatefulWidget {
  @override
  _testing_groundsState createState() => _testing_groundsState();
}

class _testing_groundsState extends State<testing_grounds> {
  Future<RecipeList> futureRecipe;
  dynamic rList;
  @override
  void initState() {
    super.initState();
    futureRecipe = fetchComplexRecipeList();
  }

  int _currentIndex = 0;
  List cardList = [Item3(), Item3(), Item3()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Future<RecipeList> fetchComplexRecipeList() async {
    final response = await http.get(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&query=pasta&maxFat=25&number=4');

    if (response.statusCode == 200) {
      print("Before the recipeList");
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
            // SafeArea(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       height: 215.0,
            //       autoPlay: true,
            //       autoPlayInterval: Duration(seconds: 15),
            //       autoPlayAnimationDuration: Duration(milliseconds: 800),
            //       autoPlayCurve: Curves.fastOutSlowIn,
            //       pauseAutoPlayOnTouch: true,
            //       aspectRatio: 2.0,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           _currentIndex = index;
            //         });
            //       },
            //     ),
            //     items: cardList.map((card) {
            //       return Builder(builder: (BuildContext context) {
            //         return Padding(
            //           padding: const EdgeInsets.only(top: 15.0),
            //           child: Container(
            //             height: MediaQuery.of(context).size.height * 0.25,
            //             width: MediaQuery.of(context).size.width * 0.66,
            //             child: Card(
            //               color: Colors.white,
            //               child: card,
            //             ),
            //           ),
            //         );
            //       });
            //     }).toList(),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: map<Widget>(cardList, (index, url) {
            //     return Container(
            //       width: 10.0,
            //       height: 10.0,
            //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color:
            //             _currentIndex == index ? Colors.blueAccent : Colors.grey,
            //       ),
            //     );
            //   }),
            // ),
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
                            child: recipeCard(
                              recipe: recipe,
                            ),
                            // child: ListTile(
                            //   title: Text(recipe.title),
                            //   subtitle: Text(recipe.id.toString()),
                            // ),
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

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(color: Colors.yellow, width: 100.0, height: 15.0),
          ),
          Align(
            alignment: Alignment.topCenter,
            child:
                Container(color: Colors.deepOrange, width: 100.0, height: 15.0),
          )
        ],
      ),
    );
  }
}

class recipeCard extends StatefulWidget {
  final Recipe recipe;

  const recipeCard({Key key, @required this.recipe}) : super(key: key);

  @override
  _recipeCardState createState() => _recipeCardState();
}

class _recipeCardState extends State<recipeCard> {
  // IconData iconSetter = LineIcons.heart_o;
  // Image image = Image.network(
  //     'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png',
  //     scale: 0.7);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            widget.recipe.image,
            scale: 0.7,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipe.title,
                style: cardTextStyleTitle,
              ),
              Text(
                widget.recipe.id.toString(),
                style: cardTextStyleSub,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecipeList {
  final List<Recipe> recipes;
  final int offset;
  final int number;
  final int totalResults;

  RecipeList({this.recipes, this.offset, this.number, this.totalResults});

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    final List recipeList = json['results'];
    List<Recipe> rList = new List<Recipe>();

    recipeList.forEach((r) {
      rList.add(Recipe.fromJson(r));
    });

    return RecipeList(
      recipes: rList,
      offset: json['offset'],
      number: json['number'],
      totalResults: json['totalResults'],
    );
  }
}

class Recipe {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final List<Nutrients> nutrients;

  Recipe({this.id, this.title, this.image, this.imageType, this.nutrients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final List nutrientsList = json['nutrition']['nutrients'];
    List<Nutrients> nList = new List<Nutrients>();

    nutrientsList.forEach((n) {
      nList.add(Nutrients.fromJson(n));
    });

    return Recipe(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        imageType: json['imageType'],
        nutrients: nList);
  }
}

class Nutrients {
  final String title;
  final double amount;
  final String unit;

  Nutrients({this.title, this.amount, this.unit});

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      title: json['title'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }
}
