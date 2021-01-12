import 'package:fast_food/screens/Main/NutrientSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';

class NameMealPlanScreen extends StatefulWidget {
  final Function(int) notifyParent;

  const NameMealPlanScreen({Key key, this.notifyParent}) : super(key: key);

  @override
  _NameMealPlanScreenState createState() => _NameMealPlanScreenState();
}

class _NameMealPlanScreenState extends State<NameMealPlanScreen> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Please name your meal plan",
          style: cardTextStyleTitle,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xffe1e1e2),
                      filled: true))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          if (nameController.text.length > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NutrientSelectionScreen(
                  notifyParent: widget.notifyParent,
                  title: nameController.text,
                ),
              ),
            );
          } else {
            Fluttertoast.showToast(
                msg: "Please enter a name",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: TextStyle(fontSize: 13.0),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
