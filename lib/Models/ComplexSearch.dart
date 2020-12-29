class ComplexSearch {
  int offset;
  int number;
  List<Results> results;
  int totalResults;

  ComplexSearch({this.offset, this.number, this.results, this.totalResults});

  ComplexSearch.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    number = json['number'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['number'] = this.number;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    return data;
  }
}

class Results {
  int id;
  int calories;
  String carbs;
  String fat;
  String image;
  String imageType;
  String protein;
  String title;

  Results(
      {this.id,
      this.calories,
      this.carbs,
      this.fat,
      this.image,
      this.imageType,
      this.protein,
      this.title});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    image = json['image'];
    imageType = json['imageType'];
    protein = json['protein'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['protein'] = this.protein;
    data['title'] = this.title;
    return data;
  }
}

// class RecipeList {
//   final List<Recipe> recipes;
//   final int offset;
//   final int number;
//   final int totalResults;
//
//   RecipeList({this.recipes, this.offset, this.number, this.totalResults});
//
//   factory RecipeList.fromJson(Map<String, dynamic> json) {
//     final List recipeList = json['results'];
//     List<Recipe> rList = new List<Recipe>();
//
//     recipeList.forEach((r) {
//       print("r in RecipeList: ${r}");
//       rList.add(Recipe.fromJson(r));
//     });
//
//     return RecipeList(
//       recipes: rList,
//       offset: json['offset'],
//       number: json['number'],
//       totalResults: json['totalResults'],
//     );
//   }
// }
//
// class Recipe {
//   final int id;
//   final String title;
//   final String image;
//   final String imageType;
//   final List<Nutrients> nutrients;
//
//   Recipe({this.id, this.title, this.image, this.imageType, this.nutrients});
//
//   factory Recipe.fromJson(Map<String, dynamic> json) {
//     final List nutrientsList = json['nutrition']['nutrients'];
//     List<Nutrients> nList = new List<Nutrients>();
//
//     nutrientsList.forEach((n) {
//       print("n in Recipe is: ${n}");
//       nList.add(Nutrients.fromJson(n));
//     });
//
//     return Recipe(
//         id: json['id'],
//         title: json['title'],
//         image: json['image'],
//         imageType: json['imageType'],
//         nutrients: nList);
//   }
// }
//
// class Nutrients {
//   final String title;
//   final double amount;
//   final String unit;
//
//   Nutrients({this.title, this.amount, this.unit});
//
//   factory Nutrients.fromJson(Map<String, dynamic> json) {
//     print("json in Nutrients is: ${json}");
//     return Nutrients(
//       title: json['title'],
//       amount: json['amount'],
//       unit: json['unit'],
//     );
//   }
// }
