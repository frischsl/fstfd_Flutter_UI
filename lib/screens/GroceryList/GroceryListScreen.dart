import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  final ingredients;

  const GroceryList({Key key, this.ingredients}) : super(key: key);

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.ingredients.length,
      itemBuilder: (context, index) {
        Map ingredients = widget.ingredients;
        var sortedKeys = ingredients.keys.toList().sort();
        String name = ingredients.keys.elementAt(index);
        String amount = ingredients[name].toStringAsFixed(2);
        return Container(
          width: double.infinity,
          height: 100.0,
          child: Text("${name} | ${amount.toString()}"),
        );
      },
    );
  }
}
