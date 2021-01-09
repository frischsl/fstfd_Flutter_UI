import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/screens/Main/WeeklyOverview.dart';
import 'package:fast_food/screens/testingScreen.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../../constants.dart';
import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/groupedCheckboxes_edited.dart';

var NutrientParams = {};
const heightBetween = 18.0;
const customElevation = 3.0;

class NutrientSelectionScreen extends StatefulWidget {
  final Function(int) notifyParent;

  const NutrientSelectionScreen({Key key, this.notifyParent}) : super(key: key);
  @override
  _NutrientSelectionScreenState createState() =>
      _NutrientSelectionScreenState();
}

class _NutrientSelectionScreenState extends State<NutrientSelectionScreen> {
  List<NutritionalCheckbox> IntolerancesCheckboxList =
      new List<NutritionalCheckbox>();

  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
    IntolerancesCheckboxList = buildNutritionalCheckboxList(IntoleranceList);
  }

  List<NutritionalCheckbox> buildNutritionalCheckboxList(List data) {
    List<NutritionalCheckbox> nCb = new List<NutritionalCheckbox>();

    data.forEach((element) {
      nCb.add(NutritionalCheckbox(name: element));
    });

    return nCb;
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
            ),
          ),
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
                Icons.add_circle_outline,
                color: Colors.green,
              )),
              Tab(
                  icon: Icon(
                Icons.error,
                color: Colors.green,
              ))
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            navBarTitle,
            style: cardTextStyleTitle,
          ),
        ),
        body: TabBarView(children: [
          SafeArea(
            child: NutrientSelectors(),
          ),
          SafeArea(
            child: DietSelector(
              intoleranceCheckboxList: IntolerancesCheckboxList,
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          splashColor: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              Text(
                "Cook!",
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => WeeklyOverview(
                  nutritionalParams: NutrientParams,
                  notifyParent: widget.notifyParent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NutrientBuilder extends StatefulWidget {
  final String nutrientName;
  final RangeValues startingSliderValue;
  final String unit;
  final double min;
  final double max;
  final int idx;
  final bool active;

  const NutrientBuilder(
      {Key key,
      @required this.nutrientName,
      @required this.startingSliderValue,
      @required this.unit,
      @required this.min,
      @required this.max,
      @required this.idx,
      this.active = false})
      : super(key: key);
  @override
  _NutrientBuilderState createState() => _NutrientBuilderState();
}

class _NutrientBuilderState extends State<NutrientBuilder> {
  RangeValues curRangeValues;
  bool isActive;
  @override
  initState() {
    super.initState();
    curRangeValues = widget.startingSliderValue;
    isActive = widget.active;
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

class NutrientSelectors extends StatefulWidget {
  @override
  _NutrientSelectorsState createState() => _NutrientSelectorsState();
}

class _NutrientSelectorsState extends State<NutrientSelectors> {
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
      RangeValues startVals = null;
      if (NutrientParams != null && NutrientParams.containsKey("min${n[0]}")) {
        startVals = RangeValues(NutrientParams["min${n[0]}"].toDouble(),
            NutrientParams["max${n[0]}"].toDouble());
      }
      nbl.add(NutrientBuilder(
        nutrientName: n[0],
        startingSliderValue: startVals ?? RangeValues(n[3], n[4]),
        unit: n[2],
        min: n[3],
        max: n[4],
        idx: count,
        active: (startVals != null) ? true : false,
      ));

      count++;
    });

    return nbl;
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: heightBetween),
          Card(
            color: Colors.white,
            elevation: customElevation,
            child: ExpandableNotifier(
              initialExpanded: true,
              child: ExpandablePanel(
                theme: ExpandableThemeData(iconColor: Colors.green),
                header: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 76.0, 50.0),
                  child: Text(
                    "Macro-Nutrients",
                    style: nutrientSelectionTitleTextStyle,
                  ),
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
          ),
          SizedBox(height: heightBetween),
          Card(
            color: Colors.white,
            elevation: customElevation,
            child: ExpandablePanel(
              theme: ExpandableThemeData(iconColor: Colors.green),
              header: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 76.0, 50.0),
                child: Text(
                  "Minerals",
                  style: nutrientSelectionTitleTextStyle,
                ),
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
          ),
          SizedBox(height: heightBetween),
          Card(
            color: Colors.white,
            elevation: customElevation,
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                iconColor: Colors.green,
              ),
              header: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 76.0, 50.0),
                child: Text(
                  "Vitamins",
                  style: nutrientSelectionTitleTextStyle,
                ),
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
          ),
          SizedBox(height: heightBetween),
          Card(
            color: Colors.white,
            elevation: customElevation,
            child: ExpandablePanel(
              theme: ExpandableThemeData(iconColor: Colors.green),
              header: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 76.0, 50.0),
                child: Text(
                  "Miscellaneous",
                  style: nutrientSelectionTitleTextStyle,
                ),
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
          ),
          SizedBox(height: 75.0),
        ],
      ),
    );
  }
}

class DietSelector extends StatefulWidget {
  final List<NutritionalCheckbox> intoleranceCheckboxList;

  const DietSelector({Key key, @required this.intoleranceCheckboxList})
      : super(key: key);
  @override
  _DietSelectorState createState() => _DietSelectorState();
}

class _DietSelectorState extends State<DietSelector> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
            child: Text(
              "Diet",
              style: nutrientSelectionTitleTextStyle,
            ),
          ),
          CheckboxGroup_edit(
              checked: [NutrientParams["Diet"]] ?? [],
              labels: DietList,
              labelStyle: cardTextStyleSub,
              activeColor: Colors.orangeAccent,
              singleSelection: true,
              onSelected: (List selected) => setState(() {
                    if (selected.length > 1) {
                      selected.removeAt(0);
                    }
                    if (selected.isNotEmpty) {
                      NutrientParams["Diet"] = selected[0].toString();
                    } else {
                      if (NutrientParams.containsKey("Diet")) {
                        NutrientParams.remove("Diet");
                      }
                    }
                  })),
          SizedBox(height: 18.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
            child: Text(
              "Intolerances",
              style: nutrientSelectionTitleTextStyle,
            ),
          ),
          CheckboxGroup_edit(
            checked: NutrientParams["Intolerances"] != null
                ? NutrientParams["Intolerances"].toString().split(",")
                : [],
            labels: IntoleranceList,
            labelStyle: cardTextStyleSub,
            activeColor: Colors.orangeAccent,
            onSelected: (List selected) => setState(() {
              if (selected.isNotEmpty) {
                if (selected.length > 1) {
                  NutrientParams["Intolerances"] = selected.join(",");
                } else {
                  NutrientParams["Intolerances"] = selected[0].toString();
                }
              } else {
                if (NutrientParams.containsKey("Intolerances")) {
                  NutrientParams.remove("Intolerances");
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}

class NutritionalCheckbox extends StatefulWidget {
  final String name;

  const NutritionalCheckbox({Key key, this.name}) : super(key: key);
  @override
  _NutritionalCheckboxState createState() => _NutritionalCheckboxState();
}

class _NutritionalCheckboxState extends State<NutritionalCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      activeColor: Colors.orangeAccent,
      onChanged: (bool newValue) {
        setState(() {
          isChecked = newValue;
        });

        if (isChecked) {
          if (DietList.contains(widget.name))
            NutrientParams["Diet"] = widget.name;
          else
            NutrientParams[widget.name] = isChecked;
        } else {
          if (NutrientParams.containsKey(widget.name)) {
            NutrientParams.remove(widget.name);
          } else if (NutrientParams.containsKey("Diet")) {
            NutrientParams.remove("Diet");
          }
        }
      },
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          widget.name,
          style: cardTextStyleSub,
        ),
      ),
    );
  }
}
