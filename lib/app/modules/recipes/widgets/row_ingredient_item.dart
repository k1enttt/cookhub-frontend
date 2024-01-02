import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key,
      required this.indexOfIngredient,
      required this.recipeId,
      this.haveIngredientsObs});

  final int recipeId;
  final int indexOfIngredient;
  final RxInt? haveIngredientsObs;

  @override
  Widget build(BuildContext context) {
    RecipesController controller = Get.put(RecipesController());
    const Color gray1 = CustomColor.gray1;
    const Color gray3 = CustomColor.gray3;

    RxList<Ingredient> ingredients =
        MyData.recipeCards[recipeId].ingredients.obs;

    // Text style
    bool isRecipeDetail = Get.arguments['isRecipeDetail'] ?? false;
    const TextStyle largeText = CustomTextStyles.largeStyle;
    TextStyle grayLargeText = CustomTextStyles.largeStyle.copyWith(
      color: gray1,
    );
    TextStyle nameStyle =
        (isRecipeDetail) ? largeText : CustomTextStyles.normalStyle;
    TextStyle quantityStyle =
        (isRecipeDetail) ? grayLargeText : CustomTextStyles.normalStyle;

    // a function get a index and state of checkbox, return a list of ingredient with index checked
    void getIngredients(value) {
      ingredients(MyData.getIngredients(
          ingredients, indexOfIngredient, value, recipeId));

      // Không phải màn hình chi tiết món ăn thì không cần cập nhật số lượng
      if (ingredients[indexOfIngredient].isDone) {
        haveIngredientsObs!.value++;
      } else {
        haveIngredientsObs!.value--;
      }
      // Cập nhật số lượng thành phần hiện có cho món ăn
      MyData.updateHaveIngredients(
          Get.arguments['recipeId'], haveIngredientsObs!.value);
    }

    return GestureDetector(
      onTap: () {
        // Cập nhật thành phần isDone cho món ăn
        debugPrint("Ingredient Item pressed");
        getIngredients(!ingredients[indexOfIngredient].isDone);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Checkbox + Tên thành phần
          // TODO: Bấm checkbox thì tăng số lượng thành phần đã có
          // Checkbox load lại trạng thái cuối cùng
          SizedBox(
            child: Row(children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Obx(
                  () => Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(
                      color: gray3,
                    ),
                    value: ingredients[indexOfIngredient].isDone,
                    activeColor: CustomColor.secondary,
                    onChanged: (value) {
                      debugPrint("Checkbox pressed");
                      getIngredients(!ingredients[indexOfIngredient].isDone);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Tên thành phần
              Obx(
                () => Text(
                  ingredients[indexOfIngredient].name,
                  style: nameStyle.copyWith(
                    decoration: ingredients[indexOfIngredient].isDone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            ]),
          ),
          // Số lượng
          Text(
            '${ingredients[indexOfIngredient].quantity == '' ? '' : ingredients[indexOfIngredient].quantity}${ingredients[indexOfIngredient].unit == '' ? '' : ' ${ingredients[indexOfIngredient].unit}'}',
            style: quantityStyle,
          ),
        ],
      ),
    );
  }
}
