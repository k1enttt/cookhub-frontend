import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:get/get.dart';

class MyData {
  // Thành phần
  static List<Ingredient> ingredients = [
    Ingredient(
      id: 1,
      name: 'Beef bones',
      quantity: '500',
      unit: 'pounds',
      isDone: false,
    ),
    Ingredient(
      id: 2,
      name: 'Yellow onions',
      quantity: '2',
      isDone: false,
    ),
    Ingredient(
      id: 3,
      name: 'Ginger',
      quantity: '100',
      unit: 'g',
      isDone: false,
    ),
    Ingredient(
      id: 4,
      name: 'Beef chuck',
      quantity: '5',
      unit: 'pounds',
      isDone: false,
    ),
    Ingredient(
      id: 5,
      name: 'Fish sauce',
      quantity: '1/2',
      unit: 'cup',
      isDone: false,
    ),
    Ingredient(
      id: 6,
      name: 'Water',
      quantity: '5',
      unit: 'quart',
      isDone: false,
    ),
    Ingredient(
      id: 7,
      name: 'Rock Sugar',
      quantity: '21/2',
      unit: 'ounces',
      isDone: false,
    ),
    Ingredient(
      id: 8,
      name: 'Cinnamon stick',
      quantity: '1',
      isDone: false,
    ),
    Ingredient(
      id: 9,
      name: 'Fennel seeds',
      quantity: '2',
      unit: 'teaspoon',
      isDone: false,
    ),
    Ingredient(
      id: 10,
      name: 'Salt',
      quantity: '1',
      unit: 'teaspoon',
      isDone: false,
    ),
    Ingredient(
      id: 11,
      name: 'Star anise',
      quantity: '8',
      isDone: false,
    ),
    Ingredient(
      id: 12,
      name: 'Slided chilli',
      isDone: false,
    ),
    Ingredient(
      id: 13,
      name: 'Spring onion',
      isDone: false,
    ),
    Ingredient(
      id: 14,
      name: 'Cilantro',
      isDone: false,
    ),
  ];

  static List<Recipe> recipeCards = [
    Recipe(
      id: 0,
      image: CustomImages.recipeAvatar,
      name: "Vietnamese Pho",
      totleIngredients: 25,
      haveIngredients: 0,
      isDone: true,
      ingredients: [
        Ingredient(
          id: 0,
          name: 'Beef bones',
          quantity: '500',
          unit: 'pounds',
          isDone: false,
        ),
        Ingredient(
          id: 1,
          name: 'Yellow onions',
          quantity: '2',
          isDone: false,
        ),
        Ingredient(
          id: 2,
          name: 'Ginger',
          quantity: '100',
          unit: 'g',
          isDone: false,
        ),
        Ingredient(
          id: 3,
          name: 'Beef chuck',
          quantity: '5',
          unit: 'pounds',
          isDone: false,
        ),
        Ingredient(
          id: 4,
          name: 'Fish sauce',
          quantity: '1/2',
          unit: 'cup',
          isDone: false,
        ),
        Ingredient(
          id: 5,
          name: 'Water',
          quantity: '5',
          unit: 'quart',
          isDone: false,
        ),
        Ingredient(
          id: 6,
          name: 'Rock Sugar',
          quantity: '21/2',
          unit: 'ounces',
          isDone: false,
        ),
        Ingredient(
          id: 7,
          name: 'Cinnamon stick',
          quantity: '1',
          isDone: false,
        ),
        Ingredient(
          id: 8,
          name: 'Fennel seeds',
          quantity: '2',
          unit: 'teaspoon',
          isDone: false,
        ),
        Ingredient(
          id: 9,
          name: 'Salt',
          quantity: '1',
          unit: 'teaspoon',
          isDone: false,
        ),
        Ingredient(
          id: 10,
          name: 'Star anise',
          quantity: '8',
          isDone: false,
        ),
        Ingredient(
          id: 11,
          name: 'Slided chilli',
          isDone: false,
        ),
        Ingredient(
          id: 12,
          name: 'Spring onion',
          isDone: false,
        ),
        Ingredient(
          id: 13,
          name: 'Cilantro',
          isDone: false,
        ),
      ],
    ),
    Recipe(
      id: 1,
      image: CustomImages.recipeAvatar,
      name: "Vietnamese Pho",
      totleIngredients: 25,
      haveIngredients: 0,
      isDone: false,
      ingredients: [
        Ingredient(
          id: 0,
          name: 'Beef bones',
          quantity: '500',
          unit: 'pounds',
          isDone: false,
        ),
        Ingredient(
          id: 1,
          name: 'Yellow onions',
          quantity: '2',
          isDone: false,
        ),
        Ingredient(
          id: 2,
          name: 'Ginger',
          quantity: '100',
          unit: 'g',
          isDone: false,
        ),
        Ingredient(
          id: 3,
          name: 'Beef chuck',
          quantity: '5',
          unit: 'pounds',
          isDone: false,
        ),
        Ingredient(
          id: 4,
          name: 'Fish sauce',
          quantity: '1/2',
          unit: 'cup',
          isDone: false,
        ),
        Ingredient(
          id: 5,
          name: 'Water',
          quantity: '5',
          unit: 'quart',
          isDone: false,
        ),
        Ingredient(
          id: 6,
          name: 'Rock Sugar',
          quantity: '21/2',
          unit: 'ounces',
          isDone: false,
        ),
        Ingredient(
          id: 7,
          name: 'Cinnamon stick',
          quantity: '1',
          isDone: false,
        ),
        Ingredient(
          id: 8,
          name: 'Fennel seeds',
          quantity: '2',
          unit: 'teaspoon',
          isDone: false,
        ),
        Ingredient(
          id: 9,
          name: 'Salt',
          quantity: '1',
          unit: 'teaspoon',
          isDone: false,
        ),
        Ingredient(
          id: 10,
          name: 'Star anise',
          quantity: '8',
          isDone: false,
        ),
        Ingredient(
          id: 11,
          name: 'Slided chilli',
          isDone: false,
        ),
        Ingredient(
          id: 12,
          name: 'Spring onion',
          isDone: false,
        ),
        Ingredient(
          id: 13,
          name: 'Cilantro',
          isDone: false,
        ),
      ],
    ),
  ];

  // Số lượng món ăn không thể < 0
  static RxInt dishQuantity = 1.obs;

  // Hàm này nhận vào danh sách thành phần, vị trí của thành phần và trạng thái của checkbox, cập nhật danh sách đã tồn tại
  static RxList<Ingredient> updateIsDoneIngredients(
      int ingredientId, bool state, int recipeId) {
    //*[LÍ DO XẢY RA BUG]
    // Do biến List ingredientList được truyền vào có giá trị isDone toàn bộ là False
    // Nên mỗi lần bấm checkbox mới thì chỉ có cập nhật checkbox sau cùng
    RxList<Ingredient> result = RxList<Ingredient>();
    for (int i = 0; i < recipeCards[recipeId].ingredients.length; i++) {
      if (i == ingredientId) {
        result.add(
          Ingredient(
            id: i,
            name: recipeCards[recipeId].ingredients[i].name,
            quantity: recipeCards[recipeId].ingredients[i].quantity,
            unit: recipeCards[recipeId].ingredients[i].unit,
            isDone: state,
          ),
        );
      } else {
        result.add(recipeCards[recipeId].ingredients[i]);
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
    recipeCards[recipeId].haveIngredients = newHaveIngredients;
  }
}
