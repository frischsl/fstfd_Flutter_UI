class ComplexSearchWithFullParams {
  List<Results> results;
  dynamic offset;
  dynamic number;
  dynamic totalResults;

  ComplexSearchWithFullParams(
      {this.results, this.offset, this.number, this.totalResults});

  ComplexSearchWithFullParams.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    return data;
  }
}

class Results {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  dynamic weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  dynamic aggregateLikes;
  dynamic spoonacularScore;
  dynamic healthScore;
  String creditsText;
  String license;
  String sourceName;
  double pricePerServing;
  dynamic id;
  String title;
  dynamic readyInMinutes;
  dynamic servings;
  String sourceUrl;
  String image;
  String imageType;
  Nutrition nutrition;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<Null> occasions;
  List<AnalyzedInstructions> analyzedInstructions;
  String spoonacularSourceUrl;

  Results(
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
      this.analyzedInstructions,
      this.spoonacularSourceUrl});

  Results.fromJson(Map<String, dynamic> json) {
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
    cuisines = json['cuisines'].cast<String>();
    dishTypes = json['dishTypes'].cast<String>();
    diets = json['diets'].cast<String>();
    if (json['occasions'] != null) {
      // occasions = new List<Null>();
      // json['occasions'].forEach((v) {
      //   occasions.add(new Null.fromJson(v));
      // });
    }
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = new List<AnalyzedInstructions>();
      json['analyzedInstructions'].forEach((v) {
        analyzedInstructions.add(new AnalyzedInstructions.fromJson(v));
      });
    }
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
    data['cuisines'] = this.cuisines;
    data['dishTypes'] = this.dishTypes;
    data['diets'] = this.diets;
    // if (this.occasions != null) {
    //   data['occasions'] = this.occasions.map((v) => v.toJson()).toList();
    // }
    if (this.analyzedInstructions != null) {
      data['analyzedInstructions'] =
          this.analyzedInstructions.map((v) => v.toJson()).toList();
    }
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
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

class I_Nutrients {
  String name;
  double amount;
  String unit;

  I_Nutrients({this.name, this.amount, this.unit});

  I_Nutrients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}

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
  dynamic amount;
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

class AnalyzedInstructions {
  String name;
  List<Steps> steps;

  AnalyzedInstructions({this.name, this.steps});

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = new List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Equipment {
  dynamic id;
  String name;
  String localizedName;
  String image;

  Equipment({this.id, this.name, this.localizedName, this.image});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }
}

class Steps {
  dynamic number;
  String step;
  List<Ingredients> ingredients;
  List<Equipment> equipment;
  Length length;

  Steps(
      {this.number, this.step, this.ingredients, this.equipment, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
    if (json['equipment'] != null) {
      equipment = new List<Equipment>();
      json['equipment'].forEach((v) {
        equipment.add(new Equipment.fromJson(v));
      });
    }
    length =
        json['length'] != null ? new Length.fromJson(json['length']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    if (this.length != null) {
      data['length'] = this.length.toJson();
    }
    return data;
  }
}

class Instr_Ingredients {
  dynamic id;
  String name;
  String localizedName;
  String image;

  Instr_Ingredients({this.id, this.name, this.localizedName, this.image});

  Instr_Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localizedName'] = this.localizedName;
    data['image'] = this.image;
    return data;
  }
}

class Length {
  dynamic number;
  String unit;

  Length({this.number, this.unit});

  Length.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unit'] = this.unit;
    return data;
  }
}
