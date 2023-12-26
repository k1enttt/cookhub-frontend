import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:get/get.dart';

class GroceryController extends GetxController {
  // Do something
  static List<Recipe> recipeCards = [
    Recipe(
        image: CustomImages.recipeAvatar,
        name: "Vietnamese Pho",
        totleIngredients: 25,
        haveIngredients: 25,
        isDone: true),
    Recipe(
        image: CustomImages.recipeAvatar,
        name: "Vietnamese Pho",
        totleIngredients: 25,
        haveIngredients: 18,
        isDone: false),
  ];

  RxList<Ingredient> ingredientsList = MyData.ingredients.obs;
}
