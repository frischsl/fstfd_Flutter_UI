import 'package:fast_food/components/Main/RecipeCard.dart';
import 'package:fast_food/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekdayRecipes extends StatefulWidget {
  final weekday;
  final indexAdd;
  final recipes;
  final mealPlanUrl;

  const WeekdayRecipes(
      {Key key, this.weekday, this.indexAdd, this.recipes, this.mealPlanUrl})
      : super(key: key);
  @override
  _WeekdayRecipesState createState() => _WeekdayRecipesState();
}

class _WeekdayRecipesState extends State<WeekdayRecipes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.weekday,
          style: weeklyOverviewWeekdayStyle,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.27,
            maxHeight: MediaQuery.of(context).size.height * 0.35,
            minWidth: double.infinity,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3, //snapshot.data.recipes.length,
            itemBuilder: (context, index) {
              final recipe = widget.recipes[index + widget.indexAdd];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  decoration: BoxDecoration(
                      // color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: RecipeCard(
                    mealPlanUrl: widget.mealPlanUrl,
                    recipe: recipe,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
