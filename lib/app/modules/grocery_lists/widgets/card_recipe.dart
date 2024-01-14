import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
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
        color: Colors.black);

    // Data
    RxInt haveIngredients = RxInt(recipe.haveIngredients);
    RxBool isDone = RxBool(recipe.isDone);

    return Card(
      elevation: 0,
      child: GestureDetector(
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
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset(
                      recipe.image,
                      width: 88,
                      height: 88,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: recipesName,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => Text(
                              "${haveIngredients.value}/${recipe.totleIngredients} ingredients",
                              style: grayNormalText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    (isDone.value)
                        ? const Icon(
                            Icons.done_rounded,
                            color: secondaryColor,
                            size: 24,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
