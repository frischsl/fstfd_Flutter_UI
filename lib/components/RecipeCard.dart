import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:fast_food/Models/ComplexSearch.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({Key key, @required this.recipe}) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
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
