import 'dart:convert';

import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:get/get.dart';

class MyData {
  // Thành phần
  static List<Ingredient> ingredients = [
    Ingredient(id: 1, name: 'Beef bones', quantity: '500', unit: 'pounds'),
    Ingredient(id: 2, name: 'Yellow onions', quantity: '2'),
    Ingredient(id: 3, name: 'Ginger', quantity: '100', unit: 'g'),
    Ingredient(id: 4, name: 'Beef chuck', quantity: '5', unit: 'pounds'),
    Ingredient(id: 5, name: 'Fish sauce', quantity: '1/2', unit: 'cup'),
    Ingredient(id: 6, name: 'Water', quantity: '5', unit: 'quart'),
    Ingredient(id: 7, name: 'Rock Sugar', quantity: '21/2', unit: 'ounces'),
    Ingredient(id: 8, name: 'Cinnamon stick', quantity: '1'),
    Ingredient(id: 9, name: 'Fennel seeds', quantity: '2', unit: 'teaspoon'),
    Ingredient(id: 10, name: 'Salt', quantity: '1', unit: 'teaspoon'),
    Ingredient(id: 11, name: 'Star anise', quantity: '8'),
    Ingredient(id: 12, name: 'Slided chilli'),
    Ingredient(id: 13, name: 'Spring onion'),
    Ingredient(id: 14, name: 'Cilantro'),
  ];

  static List<Recipe> recipeCards = [
    Recipe(
      id: 1,
      image: CustomImages.recipeAvatar,
      name: "Vietnamese Pho",
      totleIngredients: 25,
      haveIngredients: 0,
      isDone: true,
      ingredients: [
        Ingredient(id: 1, name: 'Beef bones', quantity: '500', unit: 'pounds'),
        Ingredient(id: 2, name: 'Yellow onions', quantity: '2'),
        Ingredient(id: 3, name: 'Ginger', quantity: '100', unit: 'g'),
        Ingredient(id: 4, name: 'Beef chuck', quantity: '5', unit: 'pounds'),
        Ingredient(id: 5, name: 'Fish sauce', quantity: '1/2', unit: 'cup'),
        Ingredient(id: 6, name: 'Water', quantity: '5', unit: 'quart'),
        Ingredient(id: 7, name: 'Rock Sugar', quantity: '21/2', unit: 'ounces'),
        Ingredient(id: 8, name: 'Cinnamon stick', quantity: '1'),
        Ingredient(
            id: 9, name: 'Fennel seeds', quantity: '2', unit: 'teaspoon'),
        Ingredient(id: 10, name: 'Salt', quantity: '1', unit: 'teaspoon'),
        Ingredient(id: 11, name: 'Star anise', quantity: '8'),
        Ingredient(id: 12, name: 'Slided chilli'),
        Ingredient(id: 13, name: 'Spring onion'),
        Ingredient(id: 14, name: 'Cilantro'),
      ],
    ),
    Recipe(
      id: 2,
      image: CustomImages.recipeAvatar,
      name: "Vietnamese Pho",
      totleIngredients: 25,
      haveIngredients: 0,
      isDone: false,
      ingredients: [
        Ingredient(id: 1, name: 'Beef bones', quantity: '500', unit: 'pounds'),
        Ingredient(id: 2, name: 'Yellow onions', quantity: '2'),
        Ingredient(id: 3, name: 'Ginger', quantity: '100', unit: 'g'),
        Ingredient(id: 4, name: 'Beef chuck', quantity: '5', unit: 'pounds'),
        Ingredient(id: 5, name: 'Fish sauce', quantity: '1/2', unit: 'cup'),
        Ingredient(id: 6, name: 'Water', quantity: '5', unit: 'quart'),
        Ingredient(id: 7, name: 'Rock Sugar', quantity: '21/2', unit: 'ounces'),
        Ingredient(id: 8, name: 'Cinnamon stick', quantity: '1'),
        Ingredient(
            id: 9, name: 'Fennel seeds', quantity: '2', unit: 'teaspoon'),
        Ingredient(id: 10, name: 'Salt', quantity: '1', unit: 'teaspoon'),
        Ingredient(id: 11, name: 'Star anise', quantity: '8'),
        Ingredient(id: 12, name: 'Slided chilli'),
        Ingredient(id: 13, name: 'Spring onion'),
        Ingredient(id: 14, name: 'Cilantro'),
      ],
    ),
  ];

  // Số lượng món ăn không thể < 0
  static RxInt dishQuantity = 1.obs;

  // Hàm này nhận vào danh sách thành phần, vị trí của thành phần và trạng thái của checkbox, cập nhật danh sách đã tồn tại
  static RxList<Ingredient> getIngredients(RxList<Ingredient> ingredientList,
      int ingredientId, bool state, int recipeId) {
    RxList<Ingredient> result = RxList<Ingredient>();
    for (int i = 0; i < ingredientList.length; i++) {
      if (i == ingredientId) {
        result.add(
          Ingredient(
              id: i,
              name: ingredientList[i].name,
              quantity: ingredientList[i].quantity,
              unit: ingredientList[i].unit,
              isDone: state),
        );
      } else {
        result.add(ingredientList[i]);
      }
    }
    recipeCards[recipeId].ingredients = result;
    return result;
  }

  // Hàm cập nhật số lượng thành phần hiện có cho món ăn
  static void updateHaveIngredients(
    int recipeId,
    int newHaveIngredients,
  ) {
    recipeCards[recipeId - 1].haveIngredients = newHaveIngredients;
  }
}
