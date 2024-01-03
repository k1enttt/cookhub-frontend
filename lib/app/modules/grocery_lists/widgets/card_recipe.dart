import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/grocery_controller.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/screens/recipe_detail_screen.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipeIndex});
  final int recipeIndex;

  @override
  Widget build(BuildContext context) {
    GroceryController controller = Get.find<GroceryController>();
    Recipe recipe = MyData.recipeCards[recipeIndex];

    // Color
    const Color secondaryColor = CustomColor.secondary;
    const Color gray1 = CustomColor.gray1;

    // Text style
    TextStyle grayNormalText = CustomTextStyles.normalStyle.copyWith(
      color: gray1,
    );
    const TextStyle recipesName = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      height: 1.3,
    );

    // Data
    RxInt haveIngredients = RxInt(recipe.haveIngredients);
    RxBool isDone = RxBool(recipe.isDone);

    return Card(
      elevation: 0,
      child: Obx(
        () => ListTile(
          leading: Image.asset(
            recipe.image,
            width: 88,
            height: 88,
          ),
          title: Text(
            recipe.name,
            style: recipesName,
          ),
          subtitle: Obx(
            () => Text(
              "${haveIngredients.value}/${recipe.totleIngredients} ingredients",
              style: grayNormalText,
            ),
          ),
          trailing: (isDone.value)
              ? const Icon(
                  Icons.done_rounded,
                  color: secondaryColor,
                  size: 24,
                )
              : const SizedBox(),
          onTap: () {
            debugPrint("ListTile pressed");
            Get.to(
              () => RecipeDetailScreen(recipeIndex: recipeIndex),
              arguments: {
                'isRecipeDetail': true,
                'haveIngredients': haveIngredients,
                'isDone': isDone,
              },
            );
          },
        ),
      ),
    );
  }
}
