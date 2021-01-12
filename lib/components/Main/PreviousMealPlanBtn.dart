import 'package:flutter/material.dart';

import '../../constants.dart';

class PreviousMealPlanBtn extends StatefulWidget {
  final String title;
  final String subParams;

  const PreviousMealPlanBtn({
    Key key,
    @required this.title,
    @required this.subParams,
  }) : super(key: key);
  @override
  _PreviousMealPlanBtnState createState() => _PreviousMealPlanBtnState();
}

class _PreviousMealPlanBtnState extends State<PreviousMealPlanBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.orangeAccent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title, style: mainPagePreviousBtnTitleTextStyle),
                  Text(widget.subParams,
                      style: mainPagePreviousBtnSubTextStyle),
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
