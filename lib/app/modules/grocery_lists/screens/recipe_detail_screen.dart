import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/grocery_controller.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/row_ingredient_item.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GroceryController controller = Get.find<GroceryController>();

    // Color
    const Color primaryColor = CustomColor.primary;
    const Color gray1 = CustomColor.gray1;
    const Color gray3 = CustomColor.gray3;

    // Text style
    const TextStyle heading3 = CustomTextStyles.heading3Style;
    const TextStyle largeText = CustomTextStyles.largeBoldStyle;
    TextStyle grayLargeText = CustomTextStyles.largeStyle.copyWith(
      color: gray1,
    );

    RxList<Ingredient> ingredients = controller.ingredientsList;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          // BODY
          ListView(
            children: [
              // IMAGE
              const Image(image: AssetImage(CustomImages.recipeBackground)),

              // DESCRIPTION
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      "Vietnamese Pho",
                      style: heading3,
                    ),
                    Text("5/25 ingredients", style: grayLargeText),
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
                              Text("2 serves", style: grayLargeText),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Decrease and increase button
                              IconButton(
                                onPressed: () =>
                                    debugPrint("Decrease button clicked"),
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
                                  debugPrint("Increase button clicked");
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
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: IngredientItem(
                              ingredients: ingredients, index: index),
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
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ]),
      ),
    );
  }
}
