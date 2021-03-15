import 'dart:ffi';

import 'WeeklyOverview.dart';
import 'package:fast_food/components/Main/PreviousMealPlanBtn.dart';
import 'package:fast_food/components/Main/CreateNewMealPlanBtn.dart';
import 'package:fast_food/services/FstFdAPI.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class MainPageScreen extends StatefulWidget {
  final Function(int) notifyParent;

  const MainPageScreen({Key key, this.notifyParent}) : super(key: key);
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  Future<List<MealPlans>> futureMealPlans;

  @override
  void initState() {
    super.initState();
  }

  String GetQuerySubParams(String queryString) {
    // queryString =
    //     "https://api.spoonacular.com/recipes/complexSearch?${s_apikey}&minFat=25&minIodine=25&maxFat=35&Diet=Gluten&addRecipeInformation&number=2";
    if (queryString.contains("&addRecipeInformation")) {
      String url = queryString;

      int locOfConst = url.indexOf("&addRecipeInformation");
      int locOfKey = url.indexOf("${s_apikey}&");
      url = url.substring(0, locOfConst);
      url = url.substring(locOfKey + s_apikey.length + 1, url.length);

      List<String> params = url.split("&");
      List<String> result = List<String>();

      params.forEach((p) {
        if (p.contains("min")) {
          int equalsLoc = p.indexOf("=");
          p = p.substring(3, equalsLoc);
          result.add(p);
        } else if (p.contains("max")) {
        } else {
          int equalsLoc = p.indexOf("=");
          p = p.substring(equalsLoc + 1, p.length);
          result.add(p);
        }
      });

      Set setResult = new Set.from(result);

      return setResult.join(", ");
    } else {
      return "Fat, Iodine, Gluten, Dairy";
    }
  }

  @override
  Widget build(BuildContext context) {
    futureMealPlans = FstFdAPI.GetMealPlansByUserID(kUser.userID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Let's get started.",
          style: cardTextStyleTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                CreateNewMealPlanBtn(
                  notifyParent: widget.notifyParent,
                ),
                SizedBox(
                  height: 8.0,
                ),
                FutureBuilder<List<MealPlans>>(
                  future: futureMealPlans,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("In the snapshot:");
                      print(snapshot.data);
                      List<MealPlans> mealPlans = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          itemCount: mealPlans?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WeeklyOverview(
                                              queryString:
                                                  mealPlans[index].queryString,
                                              notifyParent: widget.notifyParent,
                                              mealPlanTitle:
                                                  mealPlans[index].title,
                                            )),
                                  );
                                },
                                child: PreviousMealPlanBtn(
                                  title: mealPlans[index].title,
                                  subParams: GetQuerySubParams(
                                      mealPlans[index].queryString),
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
        ),
      ),
    );
  }
}
