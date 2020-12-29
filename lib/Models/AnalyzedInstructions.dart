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

class Steps {
  List<Equipment> equipment;
  List<Ingredients> ingredients;
  int number;
  String step;
  Temperature length;

  Steps(
      {this.equipment, this.ingredients, this.number, this.step, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    if (json['equipment'] != null) {
      equipment = new List<Equipment>();
      json['equipment'].forEach((v) {
        equipment.add(new Equipment.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
    number = json['number'];
    step = json['step'];
    length = json['length'] != null
        ? new Temperature.fromJson(json['length'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.equipment != null) {
      data['equipment'] = this.equipment.map((v) => v.toJson()).toList();
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.length != null) {
      data['length'] = this.length.toJson();
    }
    return data;
  }
}

class Equipment {
  int id;
  String image;
  String name;
  Temperature temperature;

  Equipment({this.id, this.image, this.name, this.temperature});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }
    return data;
  }
}

class Temperature {
  dynamic number;
  String unit;

  Temperature({this.number, this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
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

class Ingredients {
  int id;
  String image;
  String name;

  Ingredients({this.id, this.image, this.name});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
