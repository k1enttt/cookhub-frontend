import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:get/get.dart';

class GroceryController extends GetxController {
  RxList<Ingredient> ingredientsList = MyData.ingredients.obs;

  RxInt inViewRecipeIndex = 0.obs;

  int updateHaveIngredients(List<Ingredient> ingredients) {
    int count = 0;
    for (var ingredient in ingredients) {
      if (ingredient.isDone) {
        count++;
      }
    }
    return count;
  }
}
