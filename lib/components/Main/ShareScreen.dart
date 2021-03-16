import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/constants.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShareScreen extends StatefulWidget {
  final String title;
  final String img;
  final String mealPlanURL;
  final String type;

  const ShareScreen(
      {Key key, this.title, this.img, this.mealPlanURL, this.type})
      : super(key: key);
  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  String type;
  TextEditingController titleController;
  TextEditingController commentController;

  @override
  void initState() {
    titleController = new TextEditingController(text: widget.title);
    commentController = new TextEditingController(
        text: "Tell us how you feel about this ${widget.type}...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Share '${widget.title}'!",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 300.0,
          child: Column(
            children: [
              Flexible(
                child: _socialMediaCard(
                  height: MediaQuery.of(context).size.height * 0.29,
                  img: widget.img,
                  title: widget.title,
                  type: widget.type,
                  commentController: commentController,
                  titleController: titleController,
                ),
              ),
              Container(
                width: 150.0,
                child: RaisedButton(
                  onPressed: () async {
                    if (titleController.text.length > 0 &&
                        commentController.text.length > 0 &&
                        !commentController.text
                            .contains("Tell us how you feel")) {
                      // FstFdAPI.AddMealPlan(queryUrl, widget.title, kUser.userID);
                      bool added = await FstFdAPI.AddPost(
                          widget.mealPlanURL,
                          titleController.text,
                          commentController.text,
                          kUser.userID,
                          widget.img,
                          widget.type);

                      if (added) {
                        Navigator.pop(context);

                        Fluttertoast.showToast(
                            msg: "Successfully posted ${widget.type}",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Something went wrong, please try again",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please write a title and some comments",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Share",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _socialMediaCard(
    {String title,
    String img,
    double height,
    TextEditingController titleController,
    TextEditingController commentController,
    String type}) {
  return Container(
    margin: EdgeInsets.all(20.0),
    height: height,
    decoration: BoxDecoration(
        color: Color(0xfff3f3f4),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(blurRadius: 0.75, offset: Offset(0.0, 1.25))]),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.account_circle,
                size: 40.0,
                color: Colors.green,
              ),
              SizedBox(width: 10.0),
              Flexible(
                  child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true)))
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                width: 130.0,
                height: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(img),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: TextFormField(
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  controller: commentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onTap: () {
                    print('commentController: ${commentController.text}');
                    if (commentController?.text ==
                        "Tell us how you feel about this $type...") {
                      commentController.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
