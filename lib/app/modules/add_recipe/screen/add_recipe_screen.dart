import 'dart:convert';
import 'dart:io';

import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_image_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_ingredient_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/adjust_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/method_widget.dart';
import 'package:cookhub_frontend/app/modules/home/screens/home_screen.dart';
import 'package:cookhub_frontend/core/constants/constants.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:http/http.dart' as http;

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  int _counterDescription = 0;
  int _counterServe = 0;

  File? _selectedImage;
  Ingredient? _ingredient;

  set file(File value) => setState(() {
        _selectedImage = value;
      });

  set ingredient(Ingredient value) => setState(() {
        _ingredient = value;
      });

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _hourController = TextEditingController();
  final _minuteController = TextEditingController();

  final List<Object> _ingredientList = [
    {
      "number": 1,
      "content":
          "Place the bones and beef chuck in large stockpot and add water to cover. Bring to a boil and boil for 5 minutes. Drain in a colander and thoroughly clean the stockpot. This process removes any impurities/scum and will give you a much cleaner broth.",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-3.png?alt=media&token=94f8437c-75aa-43c2-aae5-7c8cbd86f5f9"
      ]
    },
    {
      "number": 2,
      "content":
          "Meanwhile, char your ginger and onions. Use tongs to hold the ginger and onions (one at a time) over an open flame, or place each directly on a gas burner. Turn until they’re lightly blackened and fragrant, about 5 minutes. Rinse away all the blackened skins.",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-3.png?alt=media&token=94f8437c-75aa-43c2-aae5-7c8cbd86f5f9"
      ]
    },
    {
      "number": 3,
      "content":
          "Add water (5 quarts/4.75 L, or more/less if you've scaled the recipe up or down) to the stockpot and bring to a boil. Transfer the bones and meat back to the pot, along with the charred/cleaned ginger and onions. Add the scallions, fish sauce and sugar. Reduce the heat to low, and simmer until the beef chuck is tender, about 40 minutes. Skim the surface often to remove any foam and fat.",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-5.png?alt=media&token=c241b5dc-ac00-494f-837a-4c2450a7383c"
      ]
    },
    {
      "number": 4,
      "content":
          "Remove one piece of the chuck and transfer to a bowl of ice water to stop the cooking process. Then transfer this piece of beef to a container and refrigerate (you will slice this to serve with your pho later. If you were to leave it in the pot, it would be too dry to eat). Leave the other piece of chuck in the pot to flavor the broth.",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-3.png?alt=media&token=94f8437c-75aa-43c2-aae5-7c8cbd86f5f9"
      ]
    },
    {
      "number": 5,
      "content":
          "Cover the pot and continue simmering for another 4 hours. Add the salt and continue to simmer, skimming as necessary, until you're ready to assemble the rest of the dish. Taste the broth and adjust seasoning by adding more salt, sugar, and/or fish sauce as needed.",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-3.png?alt=media&token=94f8437c-75aa-43c2-aae5-7c8cbd86f5f9"
      ]
    },
  ];

  final List<Object> _stepList = [
    {
      "name": "Beef bones",
      "amount": 500,
      "unit": "pounds",
      "status": true // nullable; default: false
    },
    {
      "name": "Beef chuck",
      "amount": 5,
      "unit": "pounds",
      "status": true // nullable; default: false
    },
    {
      "name": "Ginger",
      "amount": 100,
      "unit": "g",
      "status": true // nullable; default: false
    },
  ];

  void _incrementCount() {
    setState(() {
      _counterServe++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_counterServe == 0) {
        _counterServe = 0;
      } else {
        _counterServe--;
      }
    });
  }

  void _countLengthString() {
    setState(() {
      _counterDescription = _descriptionController.text.length;
    });
  }

  void _uploadRecipe() async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$SERVER_URL/api/v1/recipes/add-new-recipe'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'cover_url':
                'https://firebasestorage.googleapis.com/v0/b/cookhub-ef9b4.appspot.com/o/step-5.png?alt=media&token=c241b5dc-ac00-494f-837a-4c2450a7383c',
            'title': _nameController.text,
            'desc': _descriptionController.text,
            'cook_time': int.parse(_hourController.text) / 60 +
                int.parse(_minuteController.text),
            'serves': _counterServe,
            'ingredients': _ingredientList,
            'steps': _stepList,
          },
        ),
      );
      if (response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                Strings.recipeHeadline,
                style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            AddImageWidget(
              callback: (val) => setState(() {
                _selectedImage = val;
              }),
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            Text(
              Strings.recipeNameHeadline,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            InputWidget(
              textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
              controller: _nameController,
              width: double.infinity,
              label: Strings.recipeLableName,
              inputType: TextInputType.text,
              maxLength: 50,
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.recipeDescriptionHeadline,
                  style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                Text(
                  '${_descriptionController.text.length}/50',
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.gray_100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            InputWidget(
              textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
              controller: _descriptionController,
              onChanged: ((value) {
                _countLengthString();
              }),
              width: double.infinity,
              label: Strings.recipeDescription,
              inputType: TextInputType.text,
              maxLength: 50,
              maxLine: 2,
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.recipeServeHeadline,
                  style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                Row(
                  children: [
                    AdjustButton(
                      label: '-',
                      onTap: _decrementCount,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.space_16,
                      ),
                      child: Text(
                        '$_counterServe',
                        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                          color: ColorSelect.textColor,
                        ),
                      ),
                    ),
                    AdjustButton(
                      label: '+',
                      onTap: _incrementCount,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.recipeCooktimeHeadline,
                  style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                Row(
                  children: [
                    InputWidget(
                      textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      controller: _hourController,
                      inputType: TextInputType.number,
                      width: 32,
                      height: 32,
                      maxLength: 2,
                      time: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: TSizes.space_8,
                        right: TSizes.space_16,
                      ),
                      child: Text(
                        'hour',
                        style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                          color: ColorSelect.textColor,
                        ),
                      ),
                    ),
                    InputWidget(
                      textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      controller: _minuteController,
                      inputType: TextInputType.number,
                      width: 32,
                      height: 32,
                      maxLength: 2,
                      time: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: TSizes.space_8,
                      ),
                      child: Text(
                        'min',
                        style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                          color: ColorSelect.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_32,
            ),
            Text(
              Strings.recipeIngredientHeadline,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            for (int i = 0; i < 3; i++)
              AddIngredientWidget(
                id: i,
                // callback: (val) => setState(() {
                //   _ingredient = val;
                //   // _ingredientsList.add(_ingredient!);
                // }),
              ),
            Align(
              alignment: Alignment.center,
              child: AddButton(
                width: 134,
                height: 40,
                icon: Icons.add,
                buttonTitle: Strings.recipeButtonIngredient,
                buttonColor: ColorSelect.secondaryColor,
                contentColor: Colors.white,
                borderRadius: 32,
                onTap: () {},
              ),
            ),
            Text(
              Strings.recipeMethodHeadline,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            for (int i = 0; i < 5; i++)
              MethodWidget(numberTitle: (i + 1).toString()),
            const SizedBox(
              height: TSizes.space_8,
            ),
            Align(
              alignment: Alignment.center,
              child: AddButton(
                width: 93,
                height: 40,
                buttonTitle: Strings.recipeStepButton,
                icon: Icons.add,
                buttonColor: ColorSelect.secondaryColor,
                contentColor: Colors.white,
                borderRadius: 32,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: TSizes.space_32,
            ),
            AddButton(
              width: double.infinity,
              height: 56,
              borderRadius: 32,
              buttonTitle: Strings.recipeButtonCreate,
              buttonColor: ColorSelect.primaryColor,
              contentColor: Colors.white,
              onTap: _uploadRecipe,
            ),
          ],
        ),
      ),
    );
  }
}
