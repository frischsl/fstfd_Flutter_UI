import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.redAccent[400],
              tabs: [
                GButton(
                  icon: Icons.restaurant_menu,
                  text: 'Plan',
                ),
                GButton(
                  icon: LineIcons.heart_o,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}

class gBottomNavBar extends StatefulWidget {
  @override
  _gBottomNavBarState createState() => _gBottomNavBarState();
}

class _gBottomNavBarState extends State<gBottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(color: Colors.grey[50], boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.redAccent[400],
              tabs: [
                GButton(
                  icon: Icons.restaurant_menu,
                  text: 'Plan',
                ),
                GButton(
                  icon: LineIcons.heart_o,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}

// Put into scaffold body:
//      body: SafeArea(
//        child: ListView(
//          children: [
//            SizedBox(height: 30.0),
//            Text(
//              'Sunday',
//              style: TextStyle(
//                  letterSpacing: 2.0,
//                  fontFamily: 'Roboto',
//                  fontWeight: FontWeight.w900,
//                  fontSize: 24.0),
//            ),
//            SizedBox(
//              height: 200.0,
//              width: double.infinity,
//              child: ListView.builder(
////              shrinkWrap: true,
////              physics: ClampingScrollPhysics(),
//                scrollDirection: Axis.horizontal,
//                itemCount: 15,
//                itemBuilder: (BuildContext context, int index) => recipe_card(),
//              ),
//            ),
//            Text(
//              'Monday',
//              style: TextStyle(
//                  letterSpacing: 2.0,
//                  fontFamily: 'Roboto',
//                  fontWeight: FontWeight.w900,
//                  fontSize: 24.0),
//            ),
//            SizedBox(
//              height: 200.0,
//              width: double.infinity,
//              child: ListView.builder(
////              shrinkWrap: true,
////              physics: ClampingScrollPhysics(),
//                scrollDirection: Axis.horizontal,
//                itemCount: 15,
//                itemBuilder: (BuildContext context, int index) => recipe_card(),
//              ),
//            ),
//            Text(
//              'Tuesday',
//              style: TextStyle(
//                  letterSpacing: 2.0,
//                  fontFamily: 'Roboto',
//                  fontWeight: FontWeight.w900,
//                  fontSize: 24.0),
//            ),
//            SizedBox(
//              height: 200.0,
//              width: double.infinity,
//              child: ListView.builder(
////              shrinkWrap: true,
////              physics: ClampingScrollPhysics(),
//                scrollDirection: Axis.horizontal,
//                itemCount: 15,
//                itemBuilder: (BuildContext context, int index) => recipe_card(),
//              ),
//            ),
//            SizedBox(
//              height: 200.0,
//              width: double.infinity,
//              child: ListView.builder(
////              shrinkWrap: true,
////              physics: ClampingScrollPhysics(),
//                scrollDirection: Axis.horizontal,
//                itemCount: 15,
//                itemBuilder: (BuildContext context, int index) => recipe_card(),
//              ),
//            ),
//            SizedBox(
//              height: 200.0,
//              width: double.infinity,
//              child: ListView.builder(
////              shrinkWrap: true,
////              physics: ClampingScrollPhysics(),
//                scrollDirection: Axis.horizontal,
//                itemCount: 15,
//                itemBuilder: (BuildContext context, int index) => recipe_card(),
//              ),
//            ),
//          ],
//        ),
//      ), //TODO: This should not be hardcoded into the body
