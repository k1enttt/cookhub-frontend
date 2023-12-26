import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key, required this.ingredients, required this.index});
  final RxList<Ingredient> ingredients;
  final int index;

  @override
  Widget build(BuildContext context) {
    const Color gray1 = CustomColor.gray1;
    const Color gray3 = CustomColor.gray3;

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
    void getIngredients(RxList<Ingredient> list, int index, bool state) {
      List<Ingredient> result = [];
      for (int i = 0; i < ingredients.length; i++) {
        if (i == index) {
          result.add(
            Ingredient(
                name: ingredients[i].name,
                quantity: ingredients[i].quantity,
                unit: ingredients[i].unit,
                isDone: state),
          );
        } else {
          result.add(
            Ingredient(
                name: ingredients[i].name,
                quantity: ingredients[i].quantity,
                unit: ingredients[i].unit,
                isDone: ingredients[i].isDone),
          );
        }
      }
      list(result);
    }

    return GestureDetector(
      onTap: () =>
          getIngredients(ingredients, index, !ingredients[index].isDone),
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
                    value: ingredients[index].isDone,
                    activeColor: CustomColor.secondary,
                    onChanged: (value) {
                      debugPrint("Checkbox pressed");
                      getIngredients(ingredients, index, value!);
                      // ingredients[index].isDone = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Tên thành phần
              Obx(
                () => Text(
                  ingredients[index].name,
                  style: nameStyle.copyWith(
                    decoration: ingredients[index].isDone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            ]),
          ),
          // Số lượng
          Text(
            '${ingredients[index].quantity == '' ? '' : ingredients[index].quantity}${ingredients[index].unit == '' ? '' : ' ${ingredients[index].unit}'}',
            style: quantityStyle,
          ),
        ],
      ),
    );
  }
}
