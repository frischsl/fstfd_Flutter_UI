class RecipeInformation {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  int aggregateLikes;
  double spoonacularScore;
  double healthScore;
  String creditsText;
  String license;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredients> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  Nutrition nutrition;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  WinePairing winePairing;
  String instructions;
  List<String> analyzedInstructions;
  int originalId;
  String spoonacularSourceUrl;

  RecipeInformation(
      {this.vegetarian,
      this.vegan,
      this.glutenFree,
      this.dairyFree,
      this.veryHealthy,
      this.cheap,
      this.veryPopular,
      this.sustainable,
      this.weightWatcherSmartPoints,
      this.gaps,
      this.lowFodmap,
      this.aggregateLikes,
      this.spoonacularScore,
      this.healthScore,
      this.creditsText,
      this.license,
      this.sourceName,
      this.pricePerServing,
      this.extendedIngredients,
      this.id,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.image,
      this.imageType,
      this.nutrition,
      this.summary,
      this.cuisines,
      this.dishTypes,
      this.diets,
      this.occasions,
      this.winePairing,
      this.instructions,
      this.analyzedInstructions,
      this.originalId,
      this.spoonacularSourceUrl});

  RecipeInformation.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    lowFodmap = json['lowFodmap'];
    aggregateLikes = json['aggregateLikes'];
    spoonacularScore = json['spoonacularScore'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    license = json['license'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = new List<ExtendedIngredients>();
      json['extendedIngredients'].forEach((v) {
        extendedIngredients.add(new ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    summary = json['summary'];
    if (json['cuisines'] != null) {
      cuisines = json['cuisines'].cast<String>();
    }
    dishTypes = json['dishTypes'].cast<String>();
    if (json['diets'] != null) {
      diets = json['diets'].cast<String>();
    }
    // if (json['occasions'] != null) {
    //   occasions = json['occasions'].cast<String>();
    // }
    // winePairing = json['winePairing'] != null
    //     ? new WinePairing.fromJson(json['winePairing'])
    //     : null;
    instructions = json['instructions'];
    // if (json['analyzedInstructions'] != null) {
    //   analyzedInstructions = json['analyzedInstructions'].cast<String>();
    // }
    originalId = json['originalId'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vegetarian'] = this.vegetarian;
    data['vegan'] = this.vegan;
    data['glutenFree'] = this.glutenFree;
    data['dairyFree'] = this.dairyFree;
    data['veryHealthy'] = this.veryHealthy;
    data['cheap'] = this.cheap;
    data['veryPopular'] = this.veryPopular;
    data['sustainable'] = this.sustainable;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['gaps'] = this.gaps;
    data['lowFodmap'] = this.lowFodmap;
    data['aggregateLikes'] = this.aggregateLikes;
    data['spoonacularScore'] = this.spoonacularScore;
    data['healthScore'] = this.healthScore;
    data['creditsText'] = this.creditsText;
    data['license'] = this.license;
    data['sourceName'] = this.sourceName;
    data['pricePerServing'] = this.pricePerServing;
    if (this.extendedIngredients != null) {
      data['extendedIngredients'] =
          this.extendedIngredients.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition.toJson();
    }
    data['summary'] = this.summary;
    if (this.cuisines != null) {
      data['cuisines'] = this.cuisines;
    }
    data['dishTypes'] = this.dishTypes;
    if (this.diets != null) {
      data['diets'] = this.diets;
    }
    if (this.occasions != null) {
      data['occasions'] = this.occasions;
    }
    if (this.winePairing != null) {
      data['winePairing'] = this.winePairing.toJson();
    }
    data['instructions'] = this.instructions;
    if (this.analyzedInstructions != null) {
      data['analyzedInstructions'] = this.analyzedInstructions;
    }
    data['originalId'] = this.originalId;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    return data;
  }
}

class ExtendedIngredients {
  int id;
  String aisle;
  String image;
  String consistency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  ExtendedIngredients(
      {this.id,
      this.aisle,
      this.image,
      this.consistency,
      this.name,
      this.original,
      this.originalString,
      this.originalName,
      this.amount,
      this.unit,
      this.meta,
      this.metaInformation,
      this.measures});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aisle = json['aisle'];
    image = json['image'];
    consistency = json['consistency'];
    name = json['name'];
    original = json['original'];
    originalString = json['originalString'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
    // meta = json['meta'].cast<String>();
    // metaInformation = json['metaInformation'].cast<String>();
    measures = json['measures'] != null
        ? new Measures.fromJson(json['measures'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aisle'] = this.aisle;
    data['image'] = this.image;
    data['consistency'] = this.consistency;
    data['name'] = this.name;
    data['original'] = this.original;
    data['originalString'] = this.originalString;
    data['originalName'] = this.originalName;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['meta'] = this.meta;
    data['metaInformation'] = this.metaInformation;
    if (this.measures != null) {
      data['measures'] = this.measures.toJson();
    }
    return data;
  }
}

class Measures {
  Us us;
  Us metric;

  Measures({this.us, this.metric});

  Measures.fromJson(Map<String, dynamic> json) {
    us = json['us'] != null ? new Us.fromJson(json['us']) : null;
    metric = json['metric'] != null ? new Us.fromJson(json['metric']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.us != null) {
      data['us'] = this.us.toJson();
    }
    if (this.metric != null) {
      data['metric'] = this.metric.toJson();
    }
    return data;
  }
}

class Us {
  double amount;
  String unitShort;
  String unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  Us.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['unitShort'] = this.unitShort;
    data['unitLong'] = this.unitLong;
    return data;
  }
}

class Nutrition {
  List<Nutrients> nutrients;
  List<Properties> properties;
  List<Flavanoids> flavanoids;
  List<Ingredients> ingredients;
  CaloricBreakdown caloricBreakdown;
  WeightPerServing weightPerServing;

  Nutrition(
      {this.nutrients,
      this.properties,
      this.flavanoids,
      this.ingredients,
      this.caloricBreakdown,
      this.weightPerServing});

  Nutrition.fromJson(Map<String, dynamic> json) {
    if (json['nutrients'] != null) {
      nutrients = new List<Nutrients>();
      json['nutrients'].forEach((v) {
        nutrients.add(new Nutrients.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = new List<Properties>();
      json['properties'].forEach((v) {
        properties.add(new Properties.fromJson(v));
      });
    }
    if (json['flavanoids'] != null) {
      flavanoids = new List<Flavanoids>();
      json['flavanoids'].forEach((v) {
        flavanoids.add(new Flavanoids.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
    caloricBreakdown = json['caloricBreakdown'] != null
        ? new CaloricBreakdown.fromJson(json['caloricBreakdown'])
        : null;
    weightPerServing = json['weightPerServing'] != null
        ? new WeightPerServing.fromJson(json['weightPerServing'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nutrients != null) {
      data['nutrients'] = this.nutrients.map((v) => v.toJson()).toList();
    }
    if (this.properties != null) {
      data['properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    if (this.flavanoids != null) {
      data['flavanoids'] = this.flavanoids.map((v) => v.toJson()).toList();
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    if (this.caloricBreakdown != null) {
      data['caloricBreakdown'] = this.caloricBreakdown.toJson();
    }
    if (this.weightPerServing != null) {
      data['weightPerServing'] = this.weightPerServing.toJson();
    }
    return data;
  }
}

class Nutrients {
  String title;
  double amount;
  String unit;
  double percentOfDailyNeeds;

  Nutrients({this.title, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['percentOfDailyNeeds'] = this.percentOfDailyNeeds;
    return data;
  }
}

class Flavanoids {
  String title;
  double amount;
  String unit;

  Flavanoids({this.title, this.amount, this.unit});

  Flavanoids.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}

class Properties {
  String title;
  double amount;
  String unit;

  Properties({this.title, this.amount, this.unit});

  Properties.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}

class Ingredients {
  String name;
  double amount;
  String unit;
  List<Nutrients> nutrients;

  Ingredients({this.name, this.amount, this.unit, this.nutrients});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    if (json['nutrients'] != null) {
      nutrients = new List<Nutrients>();
      json['nutrients'].forEach((v) {
        nutrients.add(new Nutrients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    if (this.nutrients != null) {
      data['nutrients'] = this.nutrients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Nutrients {
//   String name;
//   double amount;
//   String unit;
//
//   Nutrients({this.name, this.amount, this.unit});
//
//   Nutrients.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     amount = json['amount'];
//     unit = json['unit'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['amount'] = this.amount;
//     data['unit'] = this.unit;
//     return data;
//   }
// }

class CaloricBreakdown {
  double percentProtein;
  double percentFat;
  double percentCarbs;

  CaloricBreakdown({this.percentProtein, this.percentFat, this.percentCarbs});

  CaloricBreakdown.fromJson(Map<String, dynamic> json) {
    percentProtein = json['percentProtein'];
    percentFat = json['percentFat'];
    percentCarbs = json['percentCarbs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentProtein'] = this.percentProtein;
    data['percentFat'] = this.percentFat;
    data['percentCarbs'] = this.percentCarbs;
    return data;
  }
}

class WeightPerServing {
  int amount;
  String unit;

  WeightPerServing({this.amount, this.unit});

  WeightPerServing.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}

class WinePairing {
  List<Null> pairedWines;
  String pairingText;
  List<Null> productMatches;

  WinePairing({this.pairedWines, this.pairingText, this.productMatches});

  // WinePairing.fromJson(Map<String, dynamic> json) {
  //   if (json['pairedWines'] != null) {
  //     pairedWines = json['pairedWines'].cast<String>();
  //   }
  //   pairingText = json['pairingText'];
  //   if (json['productMatches'] != null) {
  //     productMatches = json['productMatches'].cast<String>();
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pairedWines != null) {
      data['pairedWines'] = this.pairedWines;
    }
    data['pairingText'] = this.pairingText;
    if (this.productMatches != null) {
      data['productMatches'] = this.productMatches;
    }
    return data;
  }
}
