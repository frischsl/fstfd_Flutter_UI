import 'package:flutter/material.dart';

const s_apikey = " ";
const String navBarTitle = "Just east of pasta is health.";

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

///////////////
// Text Styling //
//////////////
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

const mainPageCreateBtnTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

const mainPagePreviousBtnSubTextStyle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat');

const mainPagePreviousBtnTitleTextStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

var nutrientSelectionTitleTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: Colors.green[800],
);

// MacroNutrients
const MacroNutrientList = [
  ["Calories", 50.0, "cals", 50.0, 800.0],
  ["Carbs", 10.0, "g", 10.0, 100.0],
  ["Fat", 1.0, "g", 1.0, 100.0],
  ["Fiber", 0.0, "g", 0.0, 100.0],
  ["Protein", 10.0, "g", 10.0, 100.0],
  ["Saturated Fat", 0.0, "g", 0.0, 100.0],
  ["Sugar", 0.0, "g", 0.0, 100.0],
];

// Minerals
const MineralsList = [
  ["Calcium", 0.0, "mg", 0.0, 100.0],
  ["Copper", 0.0, "mg", 0.0, 100.0],
  ["Fluoride", 0.0, "mg", 0.0, 100.0],
  ["Iodine", 0.0, "µg", 0.0, 100.0],
  ["Iron", 0.0, "mg", 0.0, 100.0],
  ["Magnesium", 0.0, "mg", 0.0, 100.0],
  ["Manganese", 0.0, "mg", 0.0, 100.0],
  ["Phosphorus", 0.0, "mg", 0.0, 100.0],
  ["Potassium", 0.0, "mg", 0.0, 100.0],
  ["Selenium", 0.0, "µg", 0.0, 100.0],
  ["Sodium", 0.0, "mg", 0.0, 100.0],
  ["Zinc", 0.0, "g", 0.0, 100.0]
];

// Vitamins
const VitaminsList = [
  ["Choline", 0.0, "mg", 0.0, 100.0],
  ["Folic Acid (Folate)", 0.0, "µg", 0.0, 100.0],
  ["Vitamin A", 0.0, "IU", 0.0, 100.0],
  ["Vitamin C", 0.0, "mg", 0.0, 100.0],
  ["Vitamin D", 0.0, "µg", 0.0, 100.0],
  ["Vitamin E", 0.0, "mg", 0.0, 100.0],
  ["Vitamin K", 0.0, "µg", 0.0, 100.0],
  ["Vitamin B1", 0.0, "mg", 0.0, 100.0],
  ["Vitamin B2", 0.0, "mg", 0.0, 100.0],
  ["Vitamin B3", 0.0, "mg", 0.0, 100.0],
  ["Vitamin B5", 0.0, "mg", 0.0, 100.0],
  ["Vitamin B6", 0.0, "mg", 0.0, 100.0],
  ["Vitamin B12", 0.0, "µg", 0.0, 100.0],
];

// Miscellaneous
const MiscList = [
  ["Alcohol", 0.0, "g", 0.0, 100.0],
  ["Caffeine", 0.0, "mg", 0.0, 100.0],
  ["Cholesterol", 0.0, "mg", 0.0, 100.0]
];

// Diets
const DietList = [
  "Gluten Free",
  "Ketogenic",
  "Vegetarian",
  "Lacto-Vegetarian",
  "Ovo-Vegetarian",
  "Vegan",
  "Pescetarian",
  "Paleo",
  "Primal",
  "Whole30",
];

// Intolerances
const IntoleranceList = [
  "Dairy",
  "Egg",
  "Gluten",
  "Grain",
  "Peanut",
  "Seafood",
  "Sesame",
  "Shellfish",
  "Soy",
  "Sulfite",
  "Tree Nut",
  "Wheat",
];
