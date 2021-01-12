import 'package:fast_food/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's eat!", style: cardTextStyleTitle),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Grocery List",
              style: weeklyOverviewWeekdayStyle,
            ),
          ),
          SizedBox(height: 12.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.ingredients.length,
                itemBuilder: (context, index) {
                  Map ingredients = widget.ingredients;
                  var sortedKeys = ingredients.keys.toList().sort();
                  String name = ingredients.keys.elementAt(index);
                  String amount = ingredients[name].amount.toStringAsFixed(2);
                  String unit = ingredients[name].unit;
                  name = name[0].toUpperCase() + name.substring(1);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${name} | ${amount.toString()} ${unit}",
                        style: cardTextStyleSub,
                      ),
                      Divider(
                        color: Colors.orange,
                        thickness: 1.0,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
