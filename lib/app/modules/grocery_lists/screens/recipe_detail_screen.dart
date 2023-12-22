import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/row_ingredient_item.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ingredient> ingredients = MyData.ingredients;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // IMAGE
            const Image(image: AssetImage(CustomImages.recipeBackground)),

            // DESCRIPTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                children: [
                  const Text("Vietnamese Pho"),
                  const Text("5/25 ingredients"),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text("Ingredients"),
                            SizedBox(
                              width: 20,
                            ),
                            Text("2 serves"),
                          ],
                        ),
                        Row(
                          children: [
                            // Decrease and increase button
                            IconButton(
                              onPressed: () =>
                                  debugPrint("Decrease button clicked"),
                              icon: const Icon(
                                Icons.remove_circle,
                                color: CustomColor.primary,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  debugPrint("Increase button clicked");
                                },
                                icon: const Icon(Icons.add_circle,
                                    color: CustomColor.primary)),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
