import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:fast_food/Models/AnalyzedInstructions.dart';
import 'package:http/http.dart' as http;

class RecipeInstructions extends StatefulWidget {
  final int id;

  const RecipeInstructions({Key key, this.id}) : super(key: key);
  @override
  _RecipeInstructionsState createState() => _RecipeInstructionsState();
}

class _RecipeInstructionsState extends State<RecipeInstructions> {
  Future<AnalyzedInstructions> futureRecipeInstructions;

  @override
  void initState() {
    super.initState();
    futureRecipeInstructions = fetchAnalyzedInstructions(324694);
  }

  Future<AnalyzedInstructions> fetchAnalyzedInstructions(int id) async {
    String baseUrl =
        "https://api.spoonacular.com/recipes/${id}/analyzedInstructions";
    final response = await http.get("${baseUrl}?apiKey=${s_apikey}");

    if (response.statusCode == 200) {
      return AnalyzedInstructions.fromJson(jsonDecode((response.body))[0]);
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<AnalyzedInstructions>(
          future: futureRecipeInstructions,
          builder: (context, snapshot) {
            print("snapshot: ${snapshot.data.toString()}");
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final steps = snapshot.data.steps;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: snapshot.data.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${steps[index].number}. ${steps[index].step}"),
                          Divider(
                            color: Colors.orange,
                            thickness: 1.0,
                          )
                        ],
                      );
                    }),
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
