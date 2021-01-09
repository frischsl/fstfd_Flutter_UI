import 'dart:convert';

import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:fast_food/Models/User.dart';
import 'package:http/http.dart' as http;

class FstFdAPI {
  static String root = '';

  static Future<User> Login(String email, String password) async {
    var response = await http.post(
      '${root}api/users/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200)
      return User.fromJson(jsonDecode(response.body));
    else
      return null;
  }

  static Future<bool> RegisterUser(String email, String password) async {
    var response = await http.post(
      '${root}api/users/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
