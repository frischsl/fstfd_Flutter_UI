import 'package:flutter/material.dart';
import 'package:fast_food/components/gBottomNavBar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_counter/flutter_counter.dart';

class recipe_detail extends StatefulWidget {
  @override
  _recipe_detailState createState() => _recipe_detailState();
}

class _recipe_detailState extends State<recipe_detail> {
  double _defaultValue = 1.0;
  double _counter = 1.0;
  IconData iconSetter = LineIcons.heart_o;
  Image image = Image.network(
      'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png',
      scale: 0.7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: gBottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        actions: [
          Expanded(
            child: SafeArea(
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    shape: CircleBorder(),
                    child: Icon(Icons.arrow_back_ios, size: 16.0),
                    color: Colors.redAccent[400],
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/weekly_meal_plan_overview');
                    },
                  ),
                  RaisedButton(
                    shape: CircleBorder(),
                    child: Icon(iconSetter, size: 16.0),
                    color: Colors.redAccent[400],
                    onPressed: () {
                      setState(() {
                        iconSetter = iconSetter == LineIcons.heart_o
                            ? LineIcons.heart
                            : LineIcons.heart_o;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                image,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'American Burger and Fries',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text('* * * * *'),
                        ],
                      ),
                      Text('\$12'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Placeholder for type of meal?'),
                      RaisedButton(
                        color: Colors.redAccent[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {},
//                        child: Counter(
//                          color: Colors.redAccent[400],
//                          initialValue: _defaultValue,
//                          minValue: 0.0,
//                          maxValue: 9.0,
//                          step: 1.0,
//                          decimalPlaces: 1,
//                          onChanged: (value) {
//                            setState(() {
//                              _defaultValue = value;
//                              _counter = value;
//                            });
//                          },
//                        ),
                      ),
                    ],
                  ),
                ),
                Text('Details'),
                Text(
                    'lorem ipsum this is where we can put a bunch of words that are imported from the type of meal it is.lorem ipsum this is where we can put a bunch of words that are imported from the type of meal it is.lorem ipsum this is where we can put a bunch of words that are imported from the type of meal it is.lorem ipsum this is where we can put a bunch of words that are imported from the type of meal it is.'),
                Text('Ingredients'),
                Text('Ingred 1, ingred 2, ingred 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
