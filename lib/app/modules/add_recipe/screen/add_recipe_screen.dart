import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_image_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_ingredient_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/adjust_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const AddImageWidget(),
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
          const AddIngredientWidget(),
          const AddIngredientWidget(),
          const AddIngredientWidget(),
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
          ),
        ],
      ),
    );
  }
}
