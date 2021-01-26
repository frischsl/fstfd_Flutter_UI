import 'package:fast_food/Models/User.dart';
import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/screens/SocialMedia/UserProfile.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import 'dart:math';

class SocialMediaCard extends StatefulWidget {
  final String title;
  final String img;
  final String comments;
  final int userID;
  final Posts post;

  SocialMediaCard(
      {this.title, this.img, this.comments, this.userID, this.post});
  @override
  _SocialMediaCardState createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  var rng = new Random();
  var timeUnit = ['s', 'm'];
  User userInfo = null;
  bool isLiked = false;
  var postTime;

  @override
  void initState() {
    super.initState();

    FstFdAPI.GetUserInfoByUserID(widget.userID).then((user) => setState(() {
          userInfo = user;
        }));

    postTime = calculateDisplayTime(widget.post.postedAt);
  }

  List calculateDisplayTime(DateTime dt) {
    var diff = DateTime.now().difference(dt).inSeconds;
    List<String> unit = ["s", "m", "h", "d"];
    int count = 0;
    while (diff > 59 && count < 3) {
      diff = (diff / 60).toInt();
      count++;
    }

    return [diff, unit[count]];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      // height: MediaQuery.of(context).size.height * 0.30,

      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      if (widget.userID != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileScreen(
                                      userID: widget.userID,
                                    )));
                      }
                    },
                    child: _profileCircle()),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              userInfo == null ? "User" : userInfo.firstName,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            " shared a ${widget.post.type}",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            postTime != null
                                ? "${postTime[0]}${postTime[1]}"
                                : "3s",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.blur_circular,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Image.network(widget.img ??
                        "https://spoonacular.com/recipeImages/716429-556x370.jpg"),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Text(
                    widget.comments ?? "Comments",
                    style: cardTextStyleSub,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    FstFdAPI.LikePost(widget.post.postID, !isLiked);

                    setState(() {
                      isLiked = !isLiked;
                      if (isLiked)
                        widget.post.likes += 1;
                      else
                        widget.post.likes -= 1;
                    });
                  },
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    color: isLiked ? Colors.redAccent : Colors.grey,
                    size: 22.0,
                  ),
                ),
                Text(
                  widget.post.likes == 0 ? '' : " ${widget.post.likes}",
                  style: TextStyle(
                      color: isLiked ? Colors.redAccent : Colors.grey),
                ),
                SizedBox(
                  width: 20.0,
                ),
                FaIcon(
                  FontAwesomeIcons.comment,
                  color: Colors.grey,
                  size: 22.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _profileCircle({String image}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(25.0),
    child: Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: NetworkImage(
              "https://en.pimg.jp/065/911/674/1/65911674.jpg",
            ),
            fit: BoxFit.cover),
      ),
    ),
  );
}
