import 'package:flutter/material.dart';
import 'package:fast_food/components/gBottomNavBar.dart';
import 'package:fast_food/components/recipe_card.dart';
import 'package:expand_widget/expand_widget.dart';
//import 'package:expansion_card/expansion_card.dart';
import 'package:fast_food/components/expand_block.dart';

class weekly_meal_plan_overview extends StatefulWidget {
  @override
  _weekly_meal_plan_overviewState createState() =>
      _weekly_meal_plan_overviewState();
}

class _weekly_meal_plan_overviewState extends State<weekly_meal_plan_overview> {
  IconData expansionIconSetter = Icons.expand_more;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: gBottomNavBar(),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 30.0),
            // beg
            Center(
              child: ExpansionCard(
                trailing: Icon(Icons.headset),
                title: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expansionIconSetter =
                              expansionIconSetter == Icons.expand_more
                                  ? Icons.expand_less
                                  : Icons.expand_more;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Funday',
                            style: TextStyle(
                                letterSpacing: 2.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                                fontSize: 24.0),
                          ),
                          Icon(expansionIconSetter),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                      width: double.infinity,
                      child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) =>
                            recipe_card(),
                      ),
                    ),
                  ],
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      "- 1 patty - 1 tomato - 1 cheese \n- 1 lettuce - 1 bun",
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Sunday',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => recipe_card(),
              ),
            ),
            // end
            Text(
              'Monday',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => recipe_card(),
              ),
            ),
            Text(
              'Tuesday',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0),
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => recipe_card(),
              ),
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => recipe_card(),
              ),
            ),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
//              shrinkWrap: true,
//              physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => recipe_card(),
              ),
            ),
          ],
        ),
      ), //TODO: This should not be hardcoded into the body
    );
  }
}
