import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Recipes.dart';

const recipeListKey = 'recipe_list';

class RecipeRepository {
  SharedPreferences? sharedPreferences;

  Future<List<Recipes>> getRecipeList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString =
        sharedPreferences?.getString(recipeListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Recipes.fromJson(e)).toList();
  }

  void saveRecipeList(List<Recipes> recipes) {
    final String jsonString = json.encode(recipes);
    sharedPreferences?.setString(recipeListKey, jsonString);
  }
}
