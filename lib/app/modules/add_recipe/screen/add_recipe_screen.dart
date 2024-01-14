import 'dart:io';

import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_image_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_ingredient_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/adjust_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/method_widget.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  int _counterDescription = 0;
  int _counterServe = 0;
  List<Ingredient> _ingredientsList = [];

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

  void _uploadRecipe() {
    print(_selectedImage.toString());
    print(_nameController.text);
    print(_descriptionController.text);
    print(_counterServe);
    print(_hourController.text);
    print(_minuteController.text);
    print(_ingredientsList.length);
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
                callback: (val) => setState(() {
                  _ingredient = val;
                  // _ingredientsList.add(_ingredient!);
                }),
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
