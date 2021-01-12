import 'package:fast_food/screens/Main/MainPageScreen.dart';
import 'package:fast_food/screens/SocialMedia/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';

class SocialMediaCard extends StatefulWidget {
  final String title;
  final String img;
  final String comments;
  final int userID;

  SocialMediaCard({this.title, this.img, this.comments, this.userID});
  @override
  _SocialMediaCardState createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      // height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.75, offset: Offset(0.0, 1.25), color: Colors.grey)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Flexible(
                  child: Text(
                    widget.title ?? "Title",
                    style: nutrientSelectionTitleTextStyle,
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
                FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.grey,
                  size: 22.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                FaIcon(
                  FontAwesomeIcons.comment,
                  color: Colors.grey,
                  size: 22.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                FaIcon(
                  FontAwesomeIcons.paperPlane,
                  color: Colors.grey,
                  size: 22.0,
                )
              ],
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
