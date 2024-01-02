import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/grocery_controller.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/widgets/card_recipe.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GroceryController controller = Get.put(GroceryController());

    // Color
    const Color secondaryColor = CustomColor.secondary;
    const Color gray2 = CustomColor.gray2;

    // Text style
    const TextStyle heading1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      height: 1.2,
    );
    const TextStyle heading4 = CustomTextStyles.heading4Style;
    TextStyle grayHeading4 = CustomTextStyles.heading4Style.copyWith(
      color: gray2,
    );
    const TextStyle heading5 = CustomTextStyles.heading5Style;

    List<Recipe> recipeCards = MyData.recipeCards;
    // Data

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // TITLE + ADD BUTTON
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Glocery", style: heading1),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: secondaryColor,
                      iconSize: 24,
                      onPressed: () {
                        debugPrint("Add button pressed");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              // CALENDAR
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "SUN",
                            style: heading5,
                          ),
                          Text(
                            "24",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: secondaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "MON",
                            style: heading5,
                          ),
                          Text(
                            "25",
                            style: heading4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "TUE",
                            style: heading5,
                          ),
                          Text(
                            "26",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "WED",
                            style: heading5,
                          ),
                          Text(
                            "27",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "THI",
                            style: heading5,
                          ),
                          Text(
                            "28",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "FRI",
                            style: heading5,
                          ),
                          Text(
                            "29",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "SAT",
                            style: heading5,
                          ),
                          Text(
                            "30",
                            style: grayHeading4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // LIST OF RECIPE
              Expanded(
                child: ListView.builder(
                  itemCount: recipeCards.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipeIndex: index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
