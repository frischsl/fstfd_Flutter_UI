import 'package:fast_food/screens/testingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast_food/constants.dart';

import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/components/RecipeCard.dart';

class testing_grounds extends StatefulWidget {
  @override
  _testing_groundsState createState() => _testing_groundsState();
}

class _testing_groundsState extends State<testing_grounds> {
  List<NutrientBuilder> nutrientBuilderList = new List<NutrientBuilder>();
  @override
  void initState() {
    super.initState();
    nutrientBuilderList = buildNutrients();
  }

  List<NutrientBuilder> buildNutrients() {
    List<NutrientBuilder> nbl = new List<NutrientBuilder>();
    int count = 0;
    NutrientList.forEach((n) {
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
                    params: params,
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
          "Eat pasta, feel good",
          style: cardTextStyleTitle,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: nutrientBuilderList.length ?? 1,
            itemBuilder: (context, index) {
              return nutrientBuilderList[index];
            },
          ),
        ),
      ),
    );
  }
}

var params = {};

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
  bool isActive = false;
  @override
  initState() {
    super.initState();
    curSliderValue = widget.startingSliderValue;
  }

  Widget build(BuildContext context) {
    return Card(
      color: (isActive) ? Colors.amber[200] : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.nutrientName,
                    style: cardTextStyleSub,
                  ),
                ]),
          ),
          Flexible(
            flex: 4,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (curSliderValue > widget.min) curSliderValue -= 1.0;

                      if (curSliderValue != widget.startingSliderValue) {
                        isActive = true;
                        params[widget.nutrientName] = curSliderValue.round();
                      } else {
                        isActive = false;
                        if (params.containsKey(widget.nutrientName))
                          params.remove(widget.nutrientName);
                      }
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                Card(
                  color: (isActive) ? Colors.amber[200] : Colors.white,
                  elevation: 0.0,
                  child: Slider(
                    inactiveColor: Colors.orangeAccent,
                    activeColor: Colors.deepOrangeAccent,
                    value: curSliderValue,
                    divisions: null,
                    min: widget.min,
                    max: widget.max,
                    label: curSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        curSliderValue = value;

                        if (curSliderValue != widget.startingSliderValue) {
                          isActive = true;
                          params[widget.nutrientName] = curSliderValue.round();
                        } else {
                          isActive = false;
                          if (params.containsKey(widget.nutrientName))
                            params.remove(widget.nutrientName);
                        }
                      });
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (curSliderValue < widget.max) curSliderValue += 1.0;

                      if (curSliderValue != widget.startingSliderValue) {
                        isActive = true;
                        params[widget.nutrientName] = curSliderValue.round();
                      } else {
                        isActive = false;
                        if (params.containsKey(widget.nutrientName))
                          params.remove(widget.nutrientName);
                      }
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              "${curSliderValue.round()} ${widget.unit}",
              style: cardTextStyleSub,
            ),
          ),
        ],
      ),
    );
  }
}
