import 'dart:convert';

import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/Models/User.dart';
import 'package:http/http.dart' as http;

class FstFdAPI {
  // Conveyor
  static String root = '';

  static Future<User> Login(String email, String password) async {
    var response = await http.post(
      '${root}api/users/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    print("RESPONSE: ${response.body}");
    if (response.statusCode == 200)
      return User.fromJson(jsonDecode(response.body));
    else
      return null;
  }

  static Future<bool> RegisterUser(
      String email, String password, String firstName, String lastName) async {
    var response = await http.post(
      '${root}api/users/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName
      }),
    );
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<List<MealPlans>> GetMealPlansByUserID(int userID) async {
    var response = await http.get('${root}api/mealplans/users/${userID}');

    var usersMealPlans = new List<MealPlans>();

    if (response.statusCode == 200) {
      List vals = jsonDecode(response.body);
      vals.forEach((element) {
        usersMealPlans.add(MealPlans.fromJson(element));
      });

      return usersMealPlans;
    } else
      return usersMealPlans;
  }

  static Future<List<Posts>> GetNewPosts() async {
    var response = await http.get('${root}api/posts');

    var posts = new List<Posts>();

    if (response.statusCode == 200) {
      List vals = jsonDecode(response.body);
      vals.forEach((post) {
        posts.add(Posts.fromJson(post));
      });

      return posts;
    } else
      return posts;
  }

  static Future<List<Posts>> GetPostsByUserID(int userID) async {
    var response = await http.get('${root}api/posts/${userID}');

    var posts = new List<Posts>();

    if (response.statusCode == 200) {
      List vals = jsonDecode(response.body);
      vals.forEach((post) {
        posts.add(Posts.fromJson(post));
      });

      return posts;
    } else
      return posts;
  }

  static Future<bool> AddMealPlan(
      String queryString, String title, int userID) async {
    var response = await http.post(
      '${root}api/mealplans',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'queryString': queryString,
        'title': title,
        'userID': userID
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> AddPost(String mealPlanURL, String title, String comment,
      int userID, String imgUrl, String type) async {
    var response = await http.post(
      '${root}api/posts',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'mealPlanURL': mealPlanURL,
        'title': title,
        'comment': comment,
        'userID': userID,
        'imageUrl': imgUrl,
        'type': type,
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> AddFriend(int userIDMain, int userIDFriend) async {
    var response = await http.post(
      '${root}api/friends',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userIDMain': userIDMain,
        'userIDFriend': userIDFriend,
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> DeleteFriend(int userIDMain, int userIDFriend) async {
    var response = await http.post(
      '${root}api/friends/delete',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userIDMain': userIDMain,
        'userIDFriend': userIDFriend,
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> isFriend(int userIDMain, int userIDFriend) async {
    var response = await http.post(
      '${root}api/friends/isfriend',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userIDMain': userIDMain,
        'userIDFriend': userIDFriend,
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<List<Friends>> GetFriendsByUserID(int userID) async {
    var response = await http.get('${root}api/friends/$userID');

    var friends = new List<Friends>();
    if (response.statusCode == 200) {
      List vals = jsonDecode(response.body);
      vals.forEach((friend) {
        friends.add(Friends.fromJson(friend));
      });

      return friends;
    } else
      return friends;
  }

  static Future<List<Posts>> GetPostsForFriendsByUserID(int userID) async {
    print("in api");
    List<Friends> friends = await GetFriendsByUserID(userID);
    print("aftyer friends");
    String friendIds = "";
    friends.forEach((friend) {
      friendIds += "${friend.userIDFriend},";
    });
    if (friendIds != "")
      friendIds = friendIds.substring(0, friendIds.length - 1);

    print("FriendIds: $friendIds");
    print('${root}api/posts/bulk/$friendIds');

    var response = await http.get('${root}api/posts/bulk/$friendIds');

    var posts = new List<Posts>();
    if (response.statusCode == 200) {
      List vals = jsonDecode(response.body);
      vals.forEach((post) {
        posts.add(Posts.fromJson(post));
      });

      return posts;
    } else
      return posts;
  }

  static Future<Results> getRecipeForRecipeDetails(
      String mealPlanUrl, String title) async {
    ComplexSearchWithFullParams recipes =
        await fetchComplexRecipeList(mealPlanUrl);

    Results recipe = null;
    recipes.results.forEach((r) {
      if (r.title == title) {
        recipe = r;
      }
    });

    return recipe;
  }

  static Future<User> GetUserInfoByUserID(int userID) async {
    var response = await http.get("${root}api/users/$userID");

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load user info');
    }
  }

  static Future<bool> LikePost(int postID, bool like) async {
    var response = await http.post(
      "${root}api/posts/like",
      body: jsonEncode(<String, dynamic>{'postID': postID, 'like': like}),
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to like post');
    }
  }

  static Future<ComplexSearchWithFullParams> fetchComplexRecipeList(
      String baseUrl) async {
    // String baseUrl = (widget.queryString == null) ? "" : widget.queryString;

    // if (baseUrl == "") {
    //   if (widget.nutritionalParams == {}) {
    //     baseUrl =
    //         "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=21";
    //   } else {
    //     baseUrl =
    //         "https://api.spoonacular.com/recipes/complexSearch?apiKey=${s_apikey}&${queryParams}&addRecipeInformation=true&addRecipeNutrition=true&instructionsRequired=true&number=21";
    //   }
    // }

    print("${baseUrl}");

    final response = await http.get("${baseUrl}");
    // print(response.body);
    if (response.statusCode == 200) {
      return ComplexSearchWithFullParams.fromJson(jsonDecode((response.body)));
    } else {
      throw Exception('Failed to load recipe');
    }
  }
}

class MealPlans {
  int mealPlanID;
  String queryString;
  String title;
  int userID;

  MealPlans(this.mealPlanID, this.queryString, this.title, this.userID);

  Map<String, dynamic> toMap() {
    return {
      'mealPlanID': mealPlanID,
      'queryString': queryString,
      'title': title,
      'userID': userID,
    };
  }

  factory MealPlans.fromMap(Map<String, dynamic> json) => new MealPlans(
        json['mealPlanID'],
        json['queryString'],
        json['title'],
        json['userID'],
      );

  MealPlans.fromJson(Map<String, dynamic> json) {
    mealPlanID = json['mealPlanID'];
    queryString = json['queryString'];
    title = json['title'];
    userID = json['userID'];
  }
}

class Posts {
  int postID;
  String title;
  String mealPlanURL;
  String comment;
  int userID;
  String imageUrl;
  String type;
  int likes;
  DateTime postedAt;

  Posts(this.postID, this.mealPlanURL, this.title, this.comment, this.userID,
      this.imageUrl, this.type, this.likes, this.postedAt);

  Map<String, dynamic> toMap() {
    return {
      'postID': postID,
      'mealPlanURL': mealPlanURL,
      'title': title,
      'comment': comment,
      'userID': userID,
      'imageUrl': imageUrl,
      'type': type,
      'likes': likes,
      'postedAt': postedAt,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> json) => new Posts(
        json['postID'],
        json['mealPlanURL'],
        json['title'],
        json['comment'],
        json['userID'],
        json['imageUrl'],
        json['type'],
        json['likes'],
        json['postedAt'],
      );

  Posts.fromJson(Map<String, dynamic> json) {
    postID = json['postID'];
    mealPlanURL = json['mealPlanURL'];
    title = json['title'];
    comment = json['comment'];
    userID = json['userID'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    likes = json['likes'];
    postedAt = DateTime.parse(json['postedAt']);
  }
}

class Friends {
  int id;
  int userIDMain;
  int userIDFriend;

  Friends(this.id, this.userIDMain, this.userIDFriend);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userIDMain': userIDMain,
      'userIDFriend': userIDFriend,
    };
  }

  factory Friends.fromMap(Map<String, dynamic> json) => new Friends(
        json['id'],
        json['userIDMain'],
        json['userIDFriend'],
      );

  Friends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userIDMain = json['userIDMain'];
    userIDFriend = json['userIDFriend'];
  }
}
