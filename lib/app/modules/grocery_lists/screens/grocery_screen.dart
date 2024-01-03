import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/date_model.dart';
import 'package:cookhub_frontend/app/data/models/recipe.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/widgets/card_recipe.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    RxList<Date> dates = MyData.getDate().obs;

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
                  children: List.generate(
                    dates.length,
                    (index) {
                      return GestureDetector(
                        onTap: () => {
                          debugPrint("Date pressed"),
                          dates.value = MyData.updateSelectedDay(index),
                        },
                        child: Obx(
                          () => Container(
                            decoration: (dates[index].isSelected)
                                ? const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: secondaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  )
                                : const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                            child: Column(
                              children: [
                                Text(
                                  dates[index].alias.toUpperCase(),
                                  style: heading5,
                                ),
                                Text(
                                  dates[index].day,
                                  style: (dates[index].isSelected)
                                      ? heading4
                                      : grayHeading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
