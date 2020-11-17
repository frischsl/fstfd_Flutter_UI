import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class recipe_card extends StatefulWidget {
  @override
  _recipe_cardState createState() => _recipe_cardState();
}

class _recipe_cardState extends State<recipe_card> {
  IconData iconSetter = LineIcons.heart_o;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe_detail');
      },
      child: Column(
        children: [
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200.0,
                    height: 150.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFFFFFFFF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 50.0),
                          Text(
                            'Burger & Fries',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                          Text(
                            'American',
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 14.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$12',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  child: Icon(iconSetter),
                                  onTap: () {
                                    setState(() {
                                      iconSetter =
                                          iconSetter == LineIcons.heart_o
                                              ? LineIcons.heart
                                              : LineIcons.heart_o;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png',
                    scale: 3.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
