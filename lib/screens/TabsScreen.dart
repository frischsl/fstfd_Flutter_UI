import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/screens/SocialMedia/SocialMedia.dart';
import 'package:fast_food/screens/SocialMedia/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GroceryList/GroceryListScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool isVisible = true;
  int _currentIndex = 0;
  final _mainPageScreen = GlobalKey<NavigatorState>();
  final _groceryList = GlobalKey<NavigatorState>();
  final _socialMedia = GlobalKey<NavigatorState>();
  final _userProfile = GlobalKey<NavigatorState>();

  dynamic refresh(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  dynamic setBottomNavBar(bool visible) {
    setState(() {
      isVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _mainPageScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => MainPageScreen(
                notifyParent: refresh,
              ),
            ),
          ),
          Navigator(
            key: _groceryList,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => GroceryList(ingredients: ingredients),
            ),
          ),
          Navigator(
            key: _socialMedia,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => SocialMediaScreen(
                notifyParent: refresh,
              ),
            ),
          ),
          Navigator(
            key: _userProfile,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => UserProfileScreen(
                userID: (kUser != null) ? kUser.userID : 1,
                refresh: refresh,
                navBarVisible: setBottomNavBar,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: (isVisible)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (val) => _onTap(val, context),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text('Create'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Grocery'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.thumbsUp), //Icon(Icons.whatshot),
                  title: Text('Social Media'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
              ],
            )
          : null,
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _mainPageScreen.currentState.setState(() {});
          _mainPageScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          _groceryList.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          _socialMedia.currentState.popUntil((route) => route.isFirst);
          break;
        case 3:
          _userProfile.currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}
