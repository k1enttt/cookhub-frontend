import 'package:cookhub_frontend/app/data/models/ingredient.dart';

class Recipe {
  int id;
  String image;
  String name;
  int totleIngredients;
  int haveIngredients;
  bool isDone;
  List<Ingredient> ingredients;
  Recipe({
    required this.id,
    required this.image,
    required this.name,
    required this.totleIngredients,
    required this.haveIngredients,
    required this.isDone,
    required this.ingredients,
  });
}
