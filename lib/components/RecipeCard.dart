import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/screens/recipe_detail.dart';

class RecipeCard extends StatefulWidget {
  final Results recipe;

  const RecipeCard({Key key, @required this.recipe}) : super(key: key);

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
            builder: (context) => recipe_detail(
              id: widget.recipe.id,
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
      ),
    );
  }
}
