import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/screens/recipe_detail_screen.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
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

    return Card(
      elevation: 0,
      child: ListTile(
        leading: Image.asset(
          recipe.image,
          width: 88,
          height: 88,
        ),
        title: Text(
          recipe.name,
          style: recipesName,
        ),
        subtitle: Text(
          "${recipe.haveIngredients}/${recipe.totleIngredients} ingredients",
          style: grayNormalText,
        ),
        trailing: (recipe.isDone)
            ? const Icon(
                Icons.done_rounded,
                color: secondaryColor,
                size: 24,
              )
            : const SizedBox(),
        onTap: () {
          debugPrint("ListTile pressed");
          Get.to(() => const RecipeDetailScreen(), arguments: {
            'isRecipeDetail': true,
          });
        },
      ),
    );
  }
}
