import 'package:fast_food/screens/testingScreen.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../constants.dart';

var NutrientParams = {};

class NutrientSelectionScreen extends StatefulWidget {
  @override
  _NutrientSelectionScreenState createState() =>
      _NutrientSelectionScreenState();
}

class _NutrientSelectionScreenState extends State<NutrientSelectionScreen> {
  List<NutrientBuilder> nutrientBuilderList = new List<NutrientBuilder>();

  List<NutrientBuilder> MacroNutrientBuilderList = new List<NutrientBuilder>();
  List<NutrientBuilder> MineralsNutrientBuilderList =
      new List<NutrientBuilder>();
  List<NutrientBuilder> VitaminsNutrientBuilderList =
      new List<NutrientBuilder>();
  List<NutrientBuilder> MiscNutrientBuilderList = new List<NutrientBuilder>();

  @override
  void initState() {
    super.initState();
    MacroNutrientBuilderList = buildNutrientLists(MacroNutrientList);
    MineralsNutrientBuilderList = buildNutrientLists(MineralsList);
    VitaminsNutrientBuilderList = buildNutrientLists(VitaminsList);
    MiscNutrientBuilderList = buildNutrientLists(MiscList);
  }

  List<NutrientBuilder> buildNutrientLists(List nutrientList) {
    List<NutrientBuilder> nbl = new List<NutrientBuilder>();
    int count = 0;
    nutrientList.forEach((n) {
      nbl.add(NutrientBuilder(
        nutrientName: n[0],
        startingSliderValue: n[1],
        unit: n[2],
        min: n[3],
        max: n[4],
        idx: count,
      ));

      count++;
    });

    return nbl;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataTransfer(
                    params: NutrientParams,
                  ),
                ),
              );
            },
            child: Icon(Icons.keyboard_arrow_right, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          navBarTitle,
          style: cardTextStyleTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandableNotifier(
                initialExpanded: true,
                child: ExpandablePanel(
                  header: Text(
                    "Macro-Nutrients",
                    style: nutrientSelectionTitleTextStyle,
                  ),
                  expanded: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: MacroNutrientBuilderList.length ?? 1,
                    itemBuilder: (context, index) {
                      return MacroNutrientBuilderList[index];
                    },
                  ),
                ),
              ),
              ExpandablePanel(
                header: Text(
                  "Minerals",
                  style: nutrientSelectionTitleTextStyle,
                ),
                expanded: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MineralsNutrientBuilderList.length ?? 1,
                  itemBuilder: (context, index) {
                    return MineralsNutrientBuilderList[index];
                  },
                ),
              ),
              ExpandablePanel(
                header: Text(
                  "Vitamins",
                  style: nutrientSelectionTitleTextStyle,
                ),
                expanded: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: VitaminsNutrientBuilderList.length ?? 1,
                  itemBuilder: (context, index) {
                    return VitaminsNutrientBuilderList[index];
                  },
                ),
              ),
              ExpandablePanel(
                header: Text(
                  "Miscellaneous",
                  style: nutrientSelectionTitleTextStyle,
                ),
                expanded: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MiscNutrientBuilderList.length ?? 1,
                  itemBuilder: (context, index) {
                    return MiscNutrientBuilderList[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutrientBuilder extends StatefulWidget {
  final String nutrientName;
  final double startingSliderValue;
  final String unit;
  final double min;
  final double max;
  final int idx;

  const NutrientBuilder(
      {Key key,
      @required this.nutrientName,
      @required this.startingSliderValue,
      @required this.unit,
      @required this.min,
      @required this.max,
      @required this.idx})
      : super(key: key);
  @override
  _NutrientBuilderState createState() => _NutrientBuilderState();
}

class _NutrientBuilderState extends State<NutrientBuilder> {
  double curSliderValue;
  RangeValues curRangeValues;
  bool isActive = false;
  @override
  initState() {
    super.initState();
    curSliderValue = widget.startingSliderValue;
    curRangeValues = RangeValues(widget.min, widget.max);
  }

  Widget build(BuildContext context) {
    return Card(
      color: (isActive) ? Colors.amber[200] : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: Text(
              widget.nutrientName,
              style: cardTextStyleSub,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
                child: Text(
                  "${curRangeValues.start.round()} ${widget.unit}",
                  style: cardTextStyleSub,
                ),
              ),
              Card(
                color: (isActive) ? Colors.amber[200] : Colors.white,
                elevation: 0.0,
                child: RangeSlider(
                  inactiveColor: Colors.orangeAccent,
                  activeColor: Colors.orangeAccent[400],
                  values: curRangeValues,
                  divisions: null,
                  min: widget.min,
                  max: widget.max,
                  labels: RangeLabels(
                    curRangeValues.start.round().toString(),
                    curRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      curRangeValues = values;

                      if (curRangeValues !=
                          RangeValues(widget.min, widget.max)) {
                        isActive = true;
                        NutrientParams["min${widget.nutrientName}"] =
                            curRangeValues.start.round();
                        NutrientParams["max${widget.nutrientName}"] =
                            curRangeValues.end.round();
                      } else {
                        isActive = false;
                        if (NutrientParams.containsKey(
                            "min${widget.nutrientName}")) {
                          NutrientParams.remove("min${widget.nutrientName}");
                          NutrientParams.remove("max${widget.nutrientName}");
                        }
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
                child: Text(
                  "${curRangeValues.end.round()} ${widget.unit}",
                  style: cardTextStyleSub,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Text(
// "Miscellaneous",
// style: nutrientSelectionTitleTextStyle,
// ),
// ConstrainedBox(
// constraints: BoxConstraints(minWidth: double.infinity),
// child: ListView.builder(
// physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemCount: MiscNutrientBuilderList.length ?? 1,
// itemBuilder: (context, index) {
// return MiscNutrientBuilderList[index];
// },
// ),
// ),
