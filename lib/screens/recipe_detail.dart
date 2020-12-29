import 'dart:convert';

import 'package:fast_food/Models/ComplexSearch.dart' as cs;
import 'package:fast_food/Models/RecipeInformation.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/components/gBottomNavBar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class recipe_detail extends StatefulWidget {
  final id;

  const recipe_detail({Key key, this.id}) : super(key: key);
  @override
  _recipe_detailState createState() => _recipe_detailState();
}

class _recipe_detailState extends State<recipe_detail> {
  double _defaultValue = 1.0;
  double _counter = 1.0;
  IconData iconSetter = LineIcons.heart_o;

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
  String baseUrl = "";
  @override
  void initState() {
    super.initState();
    baseUrl = "https://api.spoonacular.com/recipes/${widget.id}/information";
    futureRecipeInformation = fetchRecipeById(widget.id);
  }

  Future<RecipeInformation> fetchRecipeById(int id) async {
    final response =
        await http.get("${baseUrl}?apiKey=${s_apikey}&includeNutrition=true");

    if (response.statusCode == 200) {
      print("Below is our http response: ");
      print(response.body);
      RecipeInformation ri = new RecipeInformation();
      ri.title = json.decode(response.body)["title"];

      return RecipeInformation.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: gBottomNavBar(),
      appBar: appBar,
      // AppBar(
      //   backgroundColor: Colors.grey[50],
      //   elevation: 0.0,
      //   actions: [
      //     Expanded(
      //       child: SafeArea(
      //         child: ButtonBar(
      //           alignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             RaisedButton(
      //               shape: CircleBorder(),
      //               child: Icon(Icons.arrow_back_ios, size: 16.0),
      //               color: Colors.redAccent[400],
      //               onPressed: () {
      //                 Navigator.pushNamed(
      //                     context, '/weekly_meal_plan_overview');
      //               },
      //             ),
      //             RaisedButton(
      //               shape: CircleBorder(),
      //               child: Icon(iconSetter, size: 16.0),
      //               color: Colors.redAccent[400],
      //               onPressed: () {
      //                 setState(() {
      //                   iconSetter = iconSetter == LineIcons.heart_o
      //                       ? LineIcons.heart
      //                       : LineIcons.heart_o;
      //                 });
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          FutureBuilder<RecipeInformation>(
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Column(
                        children: [
                          image,
                          Text(
                            title,
                            style: cardTextStyleTitle,
                          ),
                          Text(servings.toString()),
                          Text(rating.toString()),
                          Text(readyInMinutes.toString()),
                          Text(nutrients[0].title),
                          Text(extendedIngredients[0].name),
                        ],
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

//           Center(
//             child: Column(
//               children: [
//                 // image,
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "asdfafds", //title,
//                             style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           // Text("${rating}"),
//                         ],
//                       ),
//                       // Text('\$${pricePerServing}'),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Placeholder for type of meal?'),
//                       RaisedButton(
//                         color: Colors.redAccent[400],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         onPressed: () {},
// //                        child: Counter(
// //                          color: Colors.redAccent[400],
// //                          initialValue: _defaultValue,
// //                          minValue: 0.0,
// //                          maxValue: 9.0,
// //                          step: 1.0,
// //                          decimalPlaces: 1,
// //                          onChanged: (value) {
// //                            setState(() {
// //                              _defaultValue = value;
// //                              _counter = value;
// //                            });
// //                          },
// //                        ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text('Details'),
//                 // Text(nutrients.toString()),
//                 Text('Ingredients'),
//                 // Text(extendedIngredients.toString()),
//               ],
//             ),
//           ),
        ],
      ),
    );
  }
}
