import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/Models/User.dart';
import 'package:fast_food/components/SocialMedia/SocialMediaCard.dart';
import 'package:fast_food/constants.dart';
import 'package:fast_food/screens/Login/LoginScreen.dart';
import 'package:fast_food/screens/Login/WelcomeScreen.dart';
import 'package:fast_food/screens/Main/RecipeDetails.dart';
import 'package:fast_food/screens/Main/WeeklyOverview.dart';
import 'package:fast_food/services/DatabaseProvider.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatefulWidget {
  final int userID;
  final Function(int) refresh;
  final Function(bool) navBarVisible;

  const UserProfileScreen(
      {Key key, this.userID, this.refresh, this.navBarVisible})
      : super(key: key);
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Future<List<Posts>> futurePosts;
  Future<User> futureUserInfo;
  bool isCurrentUser;
  bool isAdded;
  User userInfo;

  @override
  void initState() {
    // futurePosts = FstFdAPI.GetPostsByUserID(widget.userID);
    isCurrentUser = (kUser.userID == widget.userID);
    isAdded = false;

    FstFdAPI.GetUserInfoByUserID(widget.userID).then((user) => setState(() {
          userInfo = user;
        }));
    print("USERINFO: $userInfo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // futurePosts = FstFdAPI.GetPostsByUserID(widget.userID);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: (isCurrentUser)
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    (isCurrentUser)
                        ? Text("")
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: _backBtn()),
                    (isCurrentUser)
                        ? InkWell(
                            onTap: () {
                              DatabaseProvider.db
                                  .deleteUserWithId(kUser.userID);
                              widget.navBarVisible(false);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: _logoutLabel())
                        : (isAdded)
                            ? InkWell(
                                onTap: () async {
                                  bool del = await FstFdAPI.DeleteFriend(
                                      kUser.userID, widget.userID);
                                  if (del) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Successfully deleted ${userInfo.firstName ?? "friend"}",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    setState(() {
                                      isAdded = false;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Something went wrong, please try again",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: _removeFriendBtn(),
                              )
                            : InkWell(
                                onTap: () async {
                                  bool add = await FstFdAPI.AddFriend(
                                      kUser.userID, widget.userID);

                                  if (add) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Successfully added ${userInfo.firstName ?? "friend"}",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    setState(() {
                                      isAdded = true;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Something went wrong, please try again",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: _addFriendBtn()),
                  ],
                ),
                userInfo != null
                    ? (userInfo.firstName == "Zac"
                        ? _profileCircle_Image(image: ZacImage)
                        : (userInfo.firstName == "Sam"
                            ? _profileCircle_Image(image: SamImage)
                            : _profileCircle(
                                firstName: userInfo.firstName,
                                lastName: userInfo.lastName)))
                    : _profileCircle(firstName: "Sam", lastName: "Frisch"),

                // _profileCircle(
                //     firstName: userInfo.firstName, lastName: userInfo.lastName),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userInfo != null
                          ? userInfo.firstName + " " + userInfo.lastName
                          : "",
                      style: cardTextStyleTitle,
                    ),
                    // Text("Male", style: cardTextStyleSub)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text("Recently Shared:", style: cardTextStyleSub),
                  ],
                ),
                FutureBuilder(
                  future: FstFdAPI.GetPostsByUserID(widget.userID),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("USERPROFILE: $snapshot");
                      var posts = snapshot.data;

                      if (posts.length > 0) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              final Posts post = posts[index];
                              return InkWell(
                                onTap: () async {
                                  if (post.type == "Recipe") {
                                    Results recipe = await FstFdAPI
                                        .getRecipeForRecipeDetails(
                                            post.mealPlanURL, post.title);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecipeDetails(
                                                  recipe: recipe,
                                                  mealPlanUrl: post.mealPlanURL,
                                                )));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeeklyOverview(
                                                queryString: post.mealPlanURL,
                                                notifyParent: widget.refresh,
                                                mealPlanTitle: post.title,
                                              )),
                                    );
                                  }
                                },
                                child: SocialMediaCard(
                                  title: post.title,
                                  img: post.imageUrl,
                                  comments: post.comment,
                                  post: post,
                                  userID: post.userID,
                                ),
                              );
                            });
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            Text(
                              "There are no posts to show yet :(",
                              style: cardTextStyleSub,
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _profileCircle({String firstName, String lastName}) {
  return Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
    child: FittedBox(
      fit: BoxFit.fill,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              firstName[0],
              style: TextStyle(color: Colors.white),
            ),
            Text(lastName[0], style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    ),
  );
}

Widget _profileCircle_Image({String image}) {
  return ClipRRect(
    // borderRadius: BorderRadius.circular(100.0),
    child: Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: NetworkImage(
              image ?? OtherImage,
            ),
            fit: BoxFit.cover),
      ),
    ),
  );
}

Widget _addFriendBtn() {
  return RaisedButton(
    disabledColor: Colors.green,
    child: Row(
      children: [
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          "Add Friend",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _removeFriendBtn() {
  return RaisedButton(
    disabledColor: Colors.red,
    child: Row(
      children: [
        FaIcon(
          FontAwesomeIcons.minus,
          color: Colors.white,
          size: 15.0,
        ),
        Text(
          "   Remove Friend",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _logoutLabel() {
  return Text(
    "Logout",
    style: TextStyle(
        color: Colors.green, fontSize: 14, fontWeight: FontWeight.w600),
  );
}

Widget _backBtn() {
  return Row(
    children: [
      Icon(
        Icons.arrow_back_ios,
        color: Colors.green,
      ),
      Text(
        "Back",
        style: TextStyle(color: Colors.green),
      )
    ],
  );
}
