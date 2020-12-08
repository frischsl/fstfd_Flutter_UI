import 'package:flutter/material.dart';

const s_apikey = "";

// AppBar
final appBar = AppBar(
  leading: Icon(
    Icons.close,
    color: Colors.black,
  ),
  actions: [
    Icon(Icons.add, color: Colors.black),
  ],
  backgroundColor: Colors.white,
  centerTitle: true,
  title: Text(
    "Eat pasta, feel good",
    style: cardTextStyleTitle,
  ),
);

// Text Styling
const cardTextStyleTitle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
  fontSize: 20.0,
  color: Colors.black,
);
const cardTextStyleSub = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

// Macro-, Micro- Nutrients
const NutrientList = [
  ["Carbs", 10.0, "g", 10.0, 100.0],
  ["Protein", 10.0, "g", 10.0, 100.0],
  ["Calories", 50.0, "cals", 50.0, 800.0],
  ["Fat", 1.0, "g", 1.0, 100.0],
  ["Alcohol", 0.0, "g", 0.0, 100.0],
  ["Caffeine", 0.0, "g", 0.0, 100.0],
  ["Copper", 0.0, "g", 0.0, 100.0],
  ["Calcium", 0.0, "g", 0.0, 100.0]
];
