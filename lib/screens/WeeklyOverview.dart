import 'package:fast_food/Models/RecipeInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast_food/constants.dart';
import 'package:flutter/material.dart';
import 'package:fast_food/Models/ComplexSearch.dart';
import 'package:fast_food/components/RecipeCard.dart';

class WeeklyOverview extends StatefulWidget {
  final nutritionalParams;

  const WeeklyOverview({Key key, this.nutritionalParams}) : super(key: key);
  @override
  _WeeklyOverviewState createState() => _WeeklyOverviewState();
}

class _WeeklyOverviewState extends State<WeeklyOverview> {
  Future<ComplexSearch> futureRecipe;
  String queryParams = "";
  String baseUrl = "https://api.spoonacular.com/recipes/complexSearch";
  List<int> recipeIds = [];

  @override
  void initState() {
    super.initState();
    widget.nutritionalParams.forEach((k, v) => queryParams += "${k}=${v}&");
    queryParams = queryParams.substring(0, queryParams.length - 1);
    futureRecipe = fetchComplexRecipeList();
    print(widget.nutritionalParams);
  }

  Future<ComplexSearch> fetchComplexRecipeList() async {
    final response =
        await http.get("${baseUrl}?apiKey=${s_apikey}&${queryParams}&number=3");

    if (response.statusCode == 200) {
      return ComplexSearch.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }

  Future<ComplexSearch> fetchComplexRecipeList_dev() async {
    final response =
        await http.get("${baseUrl}apiKey=${s_apikey}&${queryParams}&number=3");
    final serializedData = jsonDecode("""{
    "offset": 0,
    "number": 2,
    "results": [
        {
            "id": 716429,
            "calories": 584,
            "carbs": "84g",
            "fat": "20g",
            "image": "https://spoonacular.com/recipeImages/716429-312x231.jpg",
            "imageType": "jpg",
            "protein": "19g",
            "title": "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs"
        },
        {
            "id": 715538,
            "calories": 521,
            "carbs": "69g",
            "fat": "10g",
            "image": "https://spoonacular.com/recipeImages/715538-312x231.jpg",
            "imageType": "jpg",
            "protein": "35g",
            "title": "What to make for dinner tonight?? Bruschetta Style Pork & Pasta"
        }
    ],
    "totalResults": 86
}""");

    return ComplexSearch.fromJson(jsonDecode((response.body)));
  }

  Future<List<RecipeInformation>> fetchRecipeInformationBulkList_dev() async {
    final serialzedData = jsonDecode(
        '[{"vegetarian":true,"vegan":true,"glutenFree":false,"dairyFree":true,"veryHealthy":true,"cheap":false,"veryPopular":true,"sustainable":false,"weightWatcherSmartPoints":13,"gaps":"no","lowFodmap":false,"preparationMinutes":5,"cookingMinutes":10,"aggregateLikes":67131,"spoonacularScore":100.0,"healthScore":100.0,"creditsText":"Two Peas and Their Pod","sourceName":"Two Peas and Their Pod","pricePerServing":171.39,"extendedIngredients":[{"id":9037,"aisle":"Produce","image":"avocado.jpg","consistency":"solid","name":"avocado","original":"1 large ripe Avocado, pitted and peel removed","originalString":"1 large ripe Avocado, pitted and peel removed","originalName":"ripe Avocado, pitted and peel removed","amount":1.0,"unit":"large","meta":["pitted","ripe"],"metaInformation":["pitted","ripe"],"measures":{"us":{"amount":1.0,"unitShort":"large","unitLong":"large"},"metric":{"amount":1.0,"unitShort":"large","unitLong":"large"}}},{"id":10211821,"aisle":"Produce","image":"bell-pepper-orange.png","consistency":"solid","name":"bell pepper","original":"Freshly ground black pepper, to taste","originalString":"Freshly ground black pepper, to taste","originalName":"Freshly ground black pepper, to taste","amount":2.0,"unit":"servings","meta":["black","freshly ground","to taste"],"metaInformation":["black","freshly ground","to taste"],"measures":{"us":{"amount":2.0,"unitShort":"servings","unitLong":"servings"},"metric":{"amount":2.0,"unitShort":"servings","unitLong":"servings"}}},{"id":11165,"aisle":"Produce;Spices and Seasonings","image":"cilantro.png","consistency":"solid","name":"fresh cilantro","original":"1/4 cup chopped fresh cilantro","originalString":"1/4 cup chopped fresh cilantro","originalName":"chopped fresh cilantro","amount":0.25,"unit":"cup","meta":["fresh","chopped"],"metaInformation":["fresh","chopped"],"measures":{"us":{"amount":0.25,"unitShort":"cups","unitLong":"cups"},"metric":{"amount":59.147,"unitShort":"ml","unitLong":"milliliters"}}},{"id":11215,"aisle":"Produce","image":"garlic.png","consistency":"solid","name":"garlic","original":"1 clove garlic, minced","originalString":"1 clove garlic, minced","originalName":"garlic, minced","amount":1.0,"unit":"clove","meta":["minced"],"metaInformation":["minced"],"measures":{"us":{"amount":1.0,"unitShort":"clove","unitLong":"clove"},"metric":{"amount":1.0,"unitShort":"clove","unitLong":"clove"}}},{"id":1082047,"aisle":"Spices and Seasonings","image":"salt.jpg","consistency":"solid","name":"kosher salt","original":"1/2 teaspoon kosher salt, or to taste","originalString":"1/2 teaspoon kosher salt, or to taste","originalName":"kosher salt, or to taste","amount":0.5,"unit":"teaspoon","meta":["to taste"],"metaInformation":["to taste"],"measures":{"us":{"amount":0.5,"unitShort":"tsps","unitLong":"teaspoons"},"metric":{"amount":0.5,"unitShort":"tsps","unitLong":"teaspoons"}}},{"id":9160,"aisle":"Produce","image":"lime-juice.png","consistency":"liquid","name":"lime juice","original":"1 tablespoon fresh lime juice","originalString":"1 tablespoon fresh lime juice","originalName":"fresh lime juice","amount":1.0,"unit":"tablespoon","meta":["fresh"],"metaInformation":["fresh"],"measures":{"us":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"},"metric":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"}}},{"id":20124,"aisle":"Pasta and Rice","image":"whole-wheat-spaghetti.jpg","consistency":"solid","name":"whole wheat pasta","original":"6 ounces pasta, we used whole wheat spaghetti","originalString":"6 ounces pasta, we used whole wheat spaghetti","originalName":"pasta, we used whole wheat spaghetti","amount":6.0,"unit":"ounces","meta":["whole wheat"],"metaInformation":["whole wheat"],"measures":{"us":{"amount":6.0,"unitShort":"oz","unitLong":"ounces"},"metric":{"amount":170.097,"unitShort":"g","unitLong":"grams"}}}],"id":547775,"title":"Creamy Avocado Pasta","readyInMinutes":15,"servings":2,"sourceUrl":"http://www.twopeasandtheirpod.com/creamy-avocado-pasta/","image":"https://spoonacular.com/recipeImages/547775-556x370.jpg","imageType":"jpg","summary":"Creamy Avocado Pastan is a <b>vegan</b> main course. This recipe makes 2 servings with <b>462 calories</b>, <b>15g of protein</b>, and <b>16g of fat</b> each. For <b>1.34 per serving</b>, this recipe <b>covers 25%</b> of your daily requirements of vitamins and minerals. A mixture of avocado, pasta, lime juice, and a handful of other ingredients are all it takes to make this recipe so delicious. To use up the kosher salt you could follow this main course with the <a href=\"https://spoonacular.com/recipes/low-fat-crumbs-cake-kosher-dairy-130933\">Low Fat Crumbs Cake (Kosher-Dairy)</a> as a dessert. 67127 people have tried and liked this recipe. From preparation to the plate, this recipe takes about <b>15 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 100%</b>. This score is amazing. Try <a href=\"https://spoonacular.com/recipes/my-creamy-avocado-pasta-21754\">My Creamy Avocado Pasta</a>, <a href=\"https://spoonacular.com/recipes/creamy-avocado-pasta-551035\">Creamy Avocado Pasta</a>, and <a href=\"https://spoonacular.com/recipes/creamy-avocado-pasta-512701\">Creamy Avocado Pasta</a> for similar recipes.","cuisines":[],"dishTypes":["lunch","main course","main dish","dinner"],"diets":["dairy free","lacto ovo vegetarian","vegan"],"occasions":[],"winePairing":{"pairedWines":[],"pairingText":"No one wine will suit every pasta dish. Pasta in a tomato-based sauce will usually work well with a medium-bodied red, such as a montepulciano or chianti. Pasta with seafood or pesto will fare better with a light-bodied white, such as a pinot grigio. Cheese-heavy pasta can pair well with red or white - you might try a sangiovese wine for hard cheeses and a chardonnay for soft cheeses. We may be able to make a better recommendation if you ask again with a specific pasta dish.","productMatches":[]},"instructions":"1. Bring water to a boil in a medium sized pot. Salt the water and add in your pasta, reduce heat to medium, and cook until Al Dente, about 8-10 minutes.2. While the pasta is cooking, make the sauce by placing the avocado, garlic, lime juice, cilantro, salt and pepper into a food processor or blender. Process until smooth and creamy.3. When pasta is done cooking, drain and place pasta into a large bowl. Add the sauce to the pasta and toss until pasta is well coated. Season with additional salt and pepper, if desired. Serve immediately.Note: This pasta dish is best eaten the day it is made.","analyzedInstructions":[{"name":"","steps":[{"number":1,"step":"Bring water to a boil in a medium sized pot. Salt the water and add in your pasta, reduce heat to medium, and cook until Al Dente, about 8-10 minutes.","ingredients":[{"id":20420,"name":"pasta","localizedName":"pasta","image":"fusilli.jpg"},{"id":14412,"name":"water","localizedName":"water","image":"water.png"},{"id":2047,"name":"salt","localizedName":"salt","image":"salt.jpg"}],"equipment":[{"id":404752,"name":"pot","localizedName":"pot","image":"stock-pot.jpg"}],"length":{"number":10,"unit":"minutes"}},{"number":2,"step":"While the pasta is cooking, make the sauce by placing the avocado, garlic, lime juice, cilantro, salt and pepper into a food processor or blender. Process until smooth and creamy.","ingredients":[{"id":1102047,"name":"salt and pepper","localizedName":"salt and pepper","image":"salt-and-pepper.jpg"},{"id":9160,"name":"lime juice","localizedName":"lime juice","image":"lime-juice.png"},{"id":11165,"name":"cilantro","localizedName":"cilantro","image":"cilantro.png"},{"id":9037,"name":"avocado","localizedName":"avocado","image":"avocado.jpg"},{"id":11215,"name":"garlic","localizedName":"garlic","image":"garlic.png"},{"id":20420,"name":"pasta","localizedName":"pasta","image":"fusilli.jpg"},{"id":0,"name":"sauce","localizedName":"sauce","image":""}],"equipment":[{"id":404771,"name":"food processor","localizedName":"food processor","image":"food-processor.png"},{"id":404726,"name":"blender","localizedName":"blender","image":"blender.png"}]},{"number":3,"step":"When pasta is done cooking, drain and place pasta into a large bowl.","ingredients":[{"id":20420,"name":"pasta","localizedName":"pasta","image":"fusilli.jpg"}],"equipment":[{"id":404783,"name":"bowl","localizedName":"bowl","image":"bowl.jpg"}]},{"number":4,"step":"Add the sauce to the pasta and toss until pasta is well coated. Season with additional salt and pepper, if desired.","ingredients":[{"id":1102047,"name":"salt and pepper","localizedName":"salt and pepper","image":"salt-and-pepper.jpg"},{"id":20420,"name":"pasta","localizedName":"pasta","image":"fusilli.jpg"},{"id":0,"name":"sauce","localizedName":"sauce","image":""}],"equipment":[]},{"number":5,"step":"Serve immediately.Note: This pasta dish is best eaten the day it is made.","ingredients":[{"id":20420,"name":"pasta","localizedName":"pasta","image":"fusilli.jpg"}],"equipment":[]}]}],"originalId":null},{"vegetarian":true,"vegan":true,"glutenFree":true,"dairyFree":true,"veryHealthy":true,"cheap":false,"veryPopular":true,"sustainable":false,"weightWatcherSmartPoints":1,"gaps":"no","lowFodmap":false,"preparationMinutes":10,"cookingMinutes":0,"aggregateLikes":11496,"spoonacularScore":100.0,"healthScore":100.0,"creditsText":"Feasting at Home","sourceName":"Feasting at Home","pricePerServing":156.22,"extendedIngredients":[{"id":9040,"aisle":"Produce","image":"bananas.jpg","consistency":"solid","name":"banana","original":"1 banana","originalString":"1 banana","originalName":"banana","amount":1.0,"unit":"","meta":[],"metaInformation":[],"measures":{"us":{"amount":1.0,"unitShort":"","unitLong":""},"metric":{"amount":1.0,"unitShort":"","unitLong":""}}},{"id":10014412,"aisle":"Frozen","image":"ice-cubes.png","consistency":"solid","name":"ice cubes","original":"Handful of ice cubes ( or use frozen bananas)","originalString":"Handful of ice cubes ( or use frozen bananas)","originalName":"ice cubes ( or use frozen bananas)","amount":1.0,"unit":"Handful","meta":["frozen","( or use bananas)"],"metaInformation":["frozen","( or use bananas)"],"measures":{"us":{"amount":1.0,"unitShort":"Handful","unitLong":"Handful"},"metric":{"amount":1.0,"unitShort":"Handful","unitLong":"Handful"}}},{"id":11233,"aisle":"Produce","image":"kale.jpg","consistency":"solid","name":"kale","original":"1 C kale, chopped broccoli, or spinach or any healthy green veggie","originalString":"1 C kale, chopped broccoli, or spinach or any healthy green veggie","originalName":"kale, chopped broccoli, or spinach or any healthy green veggie","amount":1.0,"unit":"C","meta":["green","or any healthy  veggie","chopped"],"metaInformation":["green","or any healthy  veggie","chopped"],"measures":{"us":{"amount":1.0,"unitShort":"cup","unitLong":"cup"},"metric":{"amount":1.0,"unitShort":"cup","unitLong":"cup"}}},{"id":9150,"aisle":"Produce","image":"lemon.png","consistency":"solid","name":"lemon","original":"tablespoon of lemon","originalString":"tablespoon of lemon","originalName":"lemon","amount":1.0,"unit":"tablespoon","meta":[],"metaInformation":[],"measures":{"us":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"},"metric":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"}}},{"id":98932,"aisle":"Tea and Coffee","image":"matcha-powder.jpg","consistency":"solid","name":"matcha powder","original":"½ teaspoon matcha powder, plus more to taste","originalString":"½ teaspoon matcha powder, plus more to taste","originalName":"matcha powder, plus more to taste","amount":0.5,"unit":"teaspoon","meta":["plus more to taste"],"metaInformation":["plus more to taste"],"measures":{"us":{"amount":0.5,"unitShort":"tsps","unitLong":"teaspoons"},"metric":{"amount":0.5,"unitShort":"tsps","unitLong":"teaspoons"}}},{"id":9266,"aisle":"Produce","image":"pineapple.jpg","consistency":"solid","name":"pineapple","original":"1 C fresh pineapple","originalString":"1 C fresh pineapple","originalName":"fresh pineapple","amount":1.0,"unit":"C","meta":["fresh"],"metaInformation":["fresh"],"measures":{"us":{"amount":1.0,"unitShort":"cup","unitLong":"cup"},"metric":{"amount":1.0,"unitShort":"cup","unitLong":"cup"}}},{"id":16223,"aisle":"Milk, Eggs, Other Dairy","image":"soy-milk.jpg","consistency":"liquid","name":"soy milk","original":"½ C nut or soy milk","originalString":"½ C nut or soy milk","originalName":"nut or soy milk","amount":0.5,"unit":"C","meta":[],"metaInformation":[],"measures":{"us":{"amount":0.5,"unitShort":"cups","unitLong":"cups"},"metric":{"amount":0.5,"unitShort":"cups","unitLong":"cups"}}}],"id":801710,"title":"Matcha Green Tea and Pineapple Smoothie","readyInMinutes":10,"servings":1,"sourceUrl":"http://www.feastingathome.com/matcha-green-tea-and-pineapple-smoothie/","image":"https://spoonacular.com/recipeImages/801710-556x370.jpg","imageType":"jpg","summary":"Need a <b>gluten free and vegan morn meal</b>? Matcha Green Tean and Pineapple Smoothie could be an outstanding recipe to try. For <b>1.57 per serving</b>, this recipe <b>covers 32%</b> of your daily requirements of vitamins and minerals. One serving contains <b>281 calories</b>, <b>10g of protein</b>, and <b>3g of fat</b>. Many people made this recipe, and 11495 would say it hit the spot. If you have soy milk, handful of ice cubes, matcha powder, and a few other ingredients on hand, you can make it. From preparation to the plate, this recipe takes approximately <b>10 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 100%</b>. This score is super. Try <a href=\"https://spoonacular.com/recipes/matcha-green-tea-smoothie-757280\">Matcha Green Tea Smoothie</a>, <a href=\"https://spoonacular.com/recipes/matcha-ginger-green-smoothie-880775\">Matcha Ginger Green Smoothie</a>, and <a href=\"https://spoonacular.com/recipes/super-green-smoothie-with-matcha-tea-837585\">Super Green Smoothie with Matcha Tea</a> for similar recipes.","cuisines":[],"dishTypes":["side dish"],"diets":["gluten free","dairy free","lacto ovo vegetarian","vegan"],"occasions":[],"winePairing":{"pairedWines":[],"pairingText":"","productMatches":[]},"instructions":"Blend all in a blender until very smooth. Enjoy!!","analyzedInstructions":[{"name":"","steps":[{"number":1,"step":"Blend all in a blender until very smooth. Enjoy!!","ingredients":[],"equipment":[{"id":404726,"name":"blender","localizedName":"blender","image":"blender.png"}]}]}],"originalId":null},{"vegetarian":true,"vegan":true,"glutenFree":true,"dairyFree":true,"veryHealthy":true,"cheap":false,"veryPopular":true,"sustainable":false,"weightWatcherSmartPoints":1,"gaps":"no","lowFodmap":false,"preparationMinutes":10,"cookingMinutes":0,"aggregateLikes":8213,"spoonacularScore":100.0,"healthScore":96.0,"creditsText":"Eating Well","sourceName":"Eating Well","pricePerServing":90.48,"extendedIngredients":[{"id":9003,"aisle":"Produce","image":"apple.jpg","consistency":"solid","name":"apple","original":"1 ripe pear or apple, peeled if desired, chopped","originalString":"1 ripe pear or apple, peeled if desired, chopped","originalName":"ripe pear or apple, peeled if desired, chopped","amount":1.0,"unit":"","meta":["ripe","peeled","chopped"],"metaInformation":["ripe","peeled","chopped"],"measures":{"us":{"amount":1.0,"unitShort":"","unitLong":""},"metric":{"amount":1.0,"unitShort":"","unitLong":""}}},{"id":9040,"aisle":"Produce","image":"bananas.jpg","consistency":"solid","name":"bananas","original":"2 ripe medium bananas","originalString":"2 ripe medium bananas","originalName":"ripe medium bananas","amount":2.0,"unit":"medium","meta":["ripe"],"metaInformation":["ripe"],"measures":{"us":{"amount":2.0,"unitShort":"medium","unitLong":"mediums"},"metric":{"amount":2.0,"unitShort":"medium","unitLong":"mediums"}}},{"id":12220,"aisle":"Health Foods;Baking","image":"flax-seeds.png","consistency":"solid","name":"ground flaxseed","original":"1 tablespoon ground flaxseed (see Notes)","originalString":"1 tablespoon ground flaxseed (see Notes)","originalName":"ground flaxseed (see Notes)","amount":1.0,"unit":"tablespoon","meta":["(see Notes)"],"metaInformation":["(see Notes)"],"measures":{"us":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"},"metric":{"amount":1.0,"unitShort":"Tbsp","unitLong":"Tbsp"}}},{"id":10014412,"aisle":"Frozen","image":"ice-cubes.png","consistency":"solid","name":"ice cubes","original":"12 ice cubes","originalString":"12 ice cubes","originalName":"ice cubes","amount":12.0,"unit":"","meta":[],"metaInformation":[],"measures":{"us":{"amount":12.0,"unitShort":"","unitLong":""},"metric":{"amount":12.0,"unitShort":"","unitLong":""}}},{"id":11233,"aisle":"Produce","image":"kale.jpg","consistency":"solid","name":"kale","original":"2 cups chopped kale leaves, tough stems removed (see Notes)","originalString":"2 cups chopped kale leaves, tough stems removed (see Notes)","originalName":"chopped kale leaves, tough stems removed (see Notes)","amount":2.0,"unit":"cups","meta":["chopped","(see Notes)"],"metaInformation":["chopped","(see Notes)"],"measures":{"us":{"amount":2.0,"unitShort":"cups","unitLong":"cups"},"metric":{"amount":473.176,"unitShort":"ml","unitLong":"milliliters"}}},{"id":9206,"aisle":"Beverages","image":"orange-juice.jpg","consistency":"liquid","name":"orange juice","original":"1/2 cup cold orange juice","originalString":"1/2 cup cold orange juice","originalName":"cold orange juice","amount":0.5,"unit":"cup","meta":["cold"],"metaInformation":["cold"],"measures":{"us":{"amount":0.5,"unitShort":"cups","unitLong":"cups"},"metric":{"amount":118.294,"unitShort":"ml","unitLong":"milliliters"}}},{"id":14412,"aisle":"Beverages","image":"water.png","consistency":"liquid","name":"water","original":"1/2 cup cold water","originalString":"1/2 cup cold water","originalName":"cold water","amount":0.5,"unit":"cup","meta":["cold"],"metaInformation":["cold"],"measures":{"us":{"amount":0.5,"unitShort":"cups","unitLong":"cups"},"metric":{"amount":118.294,"unitShort":"ml","unitLong":"milliliters"}}}],"id":695486,"title":"Green Smoothie","readyInMinutes":10,"servings":2,"sourceUrl":"http://www.eatingwell.com/recipes/green_smoothie.html","image":"https://spoonacular.com/recipeImages/695486-556x370.jpg","imageType":"jpg","summary":"Need a <b>caveman, gluten free, primal, and whole 30 morn meal</b>? Green Smoothie could be an excellent recipe to try. One serving contains <b>232 calories</b>, <b>5g of protein</b>, and <b>3g of fat</b>. For <b>90 cents per serving</b>, this recipe <b>covers 25%</b> of your daily requirements of vitamins and minerals. A mixture of water, bananas, orange juice, and a handful of other ingredients are all it takes to make this recipe so flavorful. Plenty of people made this recipe, and 8213 would say it hit the spot. From preparation to the plate, this recipe takes roughly <b>10 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 100%</b>. This score is spectacular. Try <a href=\"https://spoonacular.com/recipes/how-to-build-a-perfect-smoothie-+-a-chocolate-mint-green-smoothie-495508\">How to Build a Perfect Smoothie (+ a Chocolate Mint Green Smoothie !)</a>, <a href=\"https://spoonacular.com/recipes/pineapple-strawberry-smoothie-and-green-smoothie-ebook-719331\">Pineapple Strawberry Smoothie and Green Smoothie Ebook</a>, and <a href=\"https://spoonacular.com/recipes/stegosaurus-smoothie-my-ultimate-green-smoothie-609516\">Stegosaurus Smoothie - My Ultimate Green Smoothie</a> for similar recipes.","cuisines":[],"dishTypes":["side dish"],"diets":["gluten free","dairy free","paleolithic","lacto ovo vegetarian","primal","vegan"],"occasions":[],"winePairing":{},"instructions":null,"analyzedInstructions":[],"originalId":null}]');

    List<RecipeInformation> bulkRecipeInfo = new List<RecipeInformation>();
    print("serialzedData: ${serialzedData}");
    serialzedData.forEach((e) {
      bulkRecipeInfo.add(RecipeInformation.fromJson(e));
    });
    print("AFTER FOREACH: bulkRecipeInfo: ${bulkRecipeInfo}");

    bulkRecipeInfo.forEach((element) {
      print("Here's the list of nulls ${element}");
    });

    return bulkRecipeInfo;
  }

  Future<List<RecipeInformation>> fetchRecipeInformationBulkList() async {
    recipeIds = [716426, 715594];

    print(
        "In fetchRecipeInformationBulkList, recipeIds.join(','): ${recipeIds.join(",")}");
    String getRecipeInfoBulkUrl =
        "https://api.spoonacular.com/recipes/informationBulk?apiKey=${s_apikey}&ids=${recipeIds.join(",")}&includeNutrition=false";
    final response = await http.get(getRecipeInfoBulkUrl);
    // final response = await http.get("");
    print("getRecipeInfoBulkUrl: ${getRecipeInfoBulkUrl}");
    print("response.body: ${response.body}");
    print("response.statusCode: ${response.statusCode}");

    if (response.statusCode == 200) {
      List<RecipeInformation> bulkRecipeInfo = new List<RecipeInformation>();
      var serializeData = jsonDecode(response.body);
      print(" && Length: ${serializeData?.length}");
      print("1: ${serializeData[0]}");
      print("2: ${serializeData[0].length}");
      print("3: ${serializeData[1]}");

      RecipeInformation ri1 = RecipeInformation.fromJson(serializeData[0]);
      RecipeInformation ri2 = RecipeInformation.fromJson(serializeData[1]);

      print("r1: ${ri1.title}");
      print("r2: ${ri2.title}");

      serializeData.forEach((e) {
        print("Before E: ${e}");
        bulkRecipeInfo.add(RecipeInformation.fromJson(e));
        print("After E: ${e}\n\n\n");
      });
      print("AFTER FOREACH: bulkRecipeInfo: ${bulkRecipeInfo}");

      bulkRecipeInfo.forEach((element) {
        print("Here's the list of nulls ${element}");
      });

      return bulkRecipeInfo;
    } else {
      throw Exception('Failed to load GetRecipeInformationBulk');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sunday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            FutureBuilder<ComplexSearch>(
              future: futureRecipe,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, //snapshot.data.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = snapshot.data.results[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                                // color: Colors.orangeAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: RecipeCard(
                              recipe: recipe,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            Text(
              "Monday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            // FutureBuilder<RecipeList>(
            //   future: futureRecipe,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.37,
            //         width: double.infinity,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 3, //snapshot.data.recipes.length,
            //           itemBuilder: (context, index) {
            //             final recipe = snapshot.data.recipes[index + 3];
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.44,
            //                 decoration: BoxDecoration(
            //                     // color: Colors.orangeAccent,
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20))),
            //                 child: RecipeCard(
            //                   recipe: recipe,
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text("${snapshot.error}");
            //     }
            //     // By default, show a loading spinner.
            //     return CircularProgressIndicator();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
