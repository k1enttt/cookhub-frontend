import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key,
      required this.recipeId,
      required this.indexOfIngredient,
      this.haveIngredientsObs});

  final int recipeId;
  final int indexOfIngredient;
  final RxInt? haveIngredientsObs;

  @override
  Widget build(BuildContext context) {
    const Color gray1 = CustomColor.gray1;
    const Color gray3 = CustomColor.gray3;

    RxList<Recipe> recipeList = MyData.recipeCards.obs;
    RxList<Ingredient> ingredients = recipeList[recipeId].ingredients.obs;

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
    void onTap(value) {
      // Cập nhật trạng thái của thành phần
      // ? [BUG] Tại sao ingredients lại không được cập nhật?
      MyData.updateIsDoneIngredients(indexOfIngredient, value, recipeId);
      ingredients.value = MyData.recipeCards[recipeId].ingredients;

      // Không phải màn hình chi tiết món ăn thì không cần cập nhật số lượng
      if (ingredients[indexOfIngredient].isDone) {
        haveIngredientsObs!.value++;
      } else {
        haveIngredientsObs!.value--;
      }

      // Cập nhật số lượng thành phần hiện có cho món ăn
      MyData.updateHaveIngredients(recipeId, haveIngredientsObs!.value);

      // Kiểm tra món ăn đã đủ thành phần chưa
      RxBool isDone = Get.arguments['isDone'] ?? false.obs;
      MyData.isRecipeDone(recipeId, isDone);
    }

    return GestureDetector(
      onTap: () {
        debugPrint("Ingredient Item pressed");
        // Cập nhật thành phần isDone cho món ăn
        onTap(!ingredients[indexOfIngredient].isDone);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Checkbox + Tên thành phần
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
                      onTap(!ingredients[indexOfIngredient].isDone);
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
