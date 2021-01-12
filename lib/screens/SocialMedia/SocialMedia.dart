import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/WeeklyOverview.dart';
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/components/SocialMedia/SocialMediaCard.dart';
import 'package:fast_food/screens/Main/RecipeDetails.dart';
import 'package:fast_food/screens/testingScreen.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/groupedCheckboxes_edited.dart';

class SocialMediaScreen extends StatefulWidget {
  final Function(int) notifyParent;

  const SocialMediaScreen({Key key, this.notifyParent}) : super(key: key);
  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  int tabIndex = 0;
  Future<List<Posts>> futurePosts;
  Future<List<Posts>> futureFriendsPosts;

  @override
  void initState() {
    super.initState();
    // futurePosts = FstFdAPI.GetNewPosts();
    // futureFriendsPosts = FstFdAPI.GetPostsForFriendsByUserID(kUser.userID);
  }

  @override
  Widget build(BuildContext context) {
    futurePosts = FstFdAPI.GetNewPosts();
    futureFriendsPosts = FstFdAPI.GetPostsForFriendsByUserID(kUser.userID);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfff3f3f4),
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.green,
            onTap: (index) {
              if (tabIndex != index) {
                if (index == 0) {
                  setState(() {});
                } else {}
              }
              tabIndex = index;
            },
            tabs: [
              Tab(
                  icon: Icon(
                Icons.blur_circular,
                color: Colors.green,
              )),
              Tab(
                  icon: Icon(
                Icons.person_outline,
                color: Colors.green,
              ))
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "What's the world eating?",
            style: cardTextStyleTitle,
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<List<Posts>>(
                  future: futurePosts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Posts> posts = snapshot.data;
                      posts.forEach((element) {});
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          itemCount: posts?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () async {
                                  if (posts[index].type == "Recipe") {
                                    Results recipe = await FstFdAPI
                                        .getRecipeForRecipeDetails(
                                            posts[index].mealPlanURL,
                                            posts[index].title);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecipeDetails(
                                                  recipe: recipe,
                                                  mealPlanUrl:
                                                      posts[index].mealPlanURL,
                                                )));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeeklyOverview(
                                                queryString:
                                                    posts[index].mealPlanURL,
                                                notifyParent:
                                                    widget.notifyParent,
                                                mealPlanTitle:
                                                    posts[index].title,
                                              )),
                                    );
                                  }
                                },
                                child: SocialMediaCard(
                                  title: posts[index].title,
                                  img: posts[index].imageUrl,
                                  comments: posts[index].comment,
                                  userID: posts[index].userID,
                                ));
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: futureFriendsPosts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Posts> posts = snapshot.data;
                      if (posts.length > 0) {
                        return ListView.builder(
                            itemCount: posts.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Posts post = posts[index];
                              return InkWell(
                                onTap: () async {
                                  if (posts[index].type == "Recipe") {
                                    Results recipe = await FstFdAPI
                                        .getRecipeForRecipeDetails(
                                            posts[index].mealPlanURL,
                                            posts[index].title);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecipeDetails(
                                                  recipe: recipe,
                                                  mealPlanUrl:
                                                      posts[index].mealPlanURL,
                                                )));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeeklyOverview(
                                                queryString:
                                                    posts[index].mealPlanURL,
                                                notifyParent:
                                                    widget.notifyParent,
                                                mealPlanTitle:
                                                    posts[index].title,
                                              )),
                                    );
                                  }
                                },
                                child: SocialMediaCard(
                                  title: post.title,
                                  img: post.imageUrl,
                                  comments: post.comment,
                                  userID: post.userID,
                                ),
                              );
                            });
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 200.0),
                            Text(
                              "Sorry! Looks like none of your friends have posted yet!",
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
        ]),
      ),
    );
  }
}
