import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/RecipeDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
// import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RecipeCard extends StatefulWidget {
  final Results recipe;
  final String mealPlanUrl;

  const RecipeCard({Key key, @required this.recipe, this.mealPlanUrl})
      : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetails(
              recipe: widget.recipe,
              mealPlanUrl: widget.mealPlanUrl,
            ),
          ),
        );
      },
      child: Column(
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
                AutoSizeText(
                  widget.recipe.title,
                  style: cardTextStyleTitle,
                  maxLines: 3,
                ),
                // Text(
                //   widget.recipe.title,
                //   style: cardTextStyleTitle,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
