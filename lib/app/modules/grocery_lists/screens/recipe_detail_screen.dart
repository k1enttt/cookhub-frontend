import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/row_ingredient_item.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key, required this.recipeIndex});
  final int recipeIndex;

  @override
  Widget build(BuildContext context) {
    Recipe recipe = MyData.recipeCards[recipeIndex];

    // Color
    const Color gray1 = CustomColor.gray1;

    // Text style
    const TextStyle heading3 = CustomTextStyles.heading3Style;
    TextStyle grayLargeText = CustomTextStyles.largeStyle.copyWith(
      color: gray1,
    );

    RxInt haveIngredients = Get.arguments['haveIngredients'] ?? 0.obs;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          // BODY
          const Image(image: AssetImage(CustomImages.recipeBackground)),
          ListView(
            children: [
              // IMAGE
              const SizedBox(
                height: 390,
              ),
              // DESCRIPTION
              Container(
                // border have curve top left and top right
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  children: [
                    // Recipe name
                    const Text(
                      "Vietnamese Pho",
                      style: heading3,
                    ),
                    // Recipe description
                    Obx(() => Text(
                        "${haveIngredients.value}/${recipe.totleIngredients} ingredients",
                        style: grayLargeText)),
                    // INGREDIENTS
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Ingredients",
                                style: heading3,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Obx(
                                () => Text(
                                    "${MyData.dishQuantity.value} serves",
                                    style: grayLargeText),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Decrease and increase button
                              IconButton(
                                onPressed: () {
                                  if (MyData.dishQuantity.value > 1) {
                                    MyData.dishQuantity.value--;
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: CustomColor.primary,
                                ),
                                iconSize: 32,
                                padding: const EdgeInsets.all(0),
                                constraints: const BoxConstraints(),
                              ),
                              IconButton(
                                onPressed: () {
                                  MyData.dishQuantity.value++;
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: CustomColor.primary,
                                ),
                                iconSize: 32,
                                padding: const EdgeInsets.all(0),
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // INGREDIENTS
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recipe.ingredients.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            haveIngredients.value = recipe.haveIngredients;
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: IngredientItem(
                              recipeId: recipeIndex,
                              indexOfIngredient: index,
                              haveIngredientsObs: haveIngredients,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // BACK BUTTON
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                debugPrint("Back button pressed");
                Get.back();
              },
              icon: const Icon(Icons.arrow_circle_left),
              color: Colors.white,
              iconSize: 32,
            ),
          ),
        ]),
      ),
    );
  }
}
