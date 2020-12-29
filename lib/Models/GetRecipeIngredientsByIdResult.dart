class RecipeIngredients {
  List<Ingredients> ingredients;

  RecipeIngredients({this.ingredients});

  RecipeIngredients.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  Amount amount;
  String image;
  String name;

  Ingredients({this.amount, this.image, this.name});

  Ingredients.fromJson(Map<String, dynamic> json) {
    amount =
        json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class Amount {
  Metric metric;
  Metric us;

  Amount({this.metric, this.us});

  Amount.fromJson(Map<String, dynamic> json) {
    metric =
        json['metric'] != null ? new Metric.fromJson(json['metric']) : null;
    us = json['us'] != null ? new Metric.fromJson(json['us']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metric != null) {
      data['metric'] = this.metric.toJson();
    }
    if (this.us != null) {
      data['us'] = this.us.toJson();
    }
    return data;
  }
}

class Metric {
  String unit;
  double value;

  Metric({this.unit, this.value});

  Metric.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
