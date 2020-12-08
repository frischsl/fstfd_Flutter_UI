class RecipeList {
  final List<Recipe> recipes;
  final int offset;
  final int number;
  final int totalResults;

  RecipeList({this.recipes, this.offset, this.number, this.totalResults});

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    final List recipeList = json['results'];
    List<Recipe> rList = new List<Recipe>();

    recipeList.forEach((r) {
      rList.add(Recipe.fromJson(r));
    });

    return RecipeList(
      recipes: rList,
      offset: json['offset'],
      number: json['number'],
      totalResults: json['totalResults'],
    );
  }
}

class Recipe {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final List<Nutrients> nutrients;

  Recipe({this.id, this.title, this.image, this.imageType, this.nutrients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final List nutrientsList = json['nutrition']['nutrients'];
    List<Nutrients> nList = new List<Nutrients>();

    nutrientsList.forEach((n) {
      nList.add(Nutrients.fromJson(n));
    });

    return Recipe(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        imageType: json['imageType'],
        nutrients: nList);
  }
}

class Nutrients {
  final String title;
  final double amount;
  final String unit;

  Nutrients({this.title, this.amount, this.unit});

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      title: json['title'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }
}
