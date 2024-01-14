import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/drag_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/remove_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

typedef void IngredientCallback(Ingredient ingredient);

class AddIngredientWidget extends StatefulWidget {
  final IngredientCallback callback;
  final int id;

  const AddIngredientWidget({
    super.key,
    required this.callback,
    required this.id,
  });

  @override
  State<AddIngredientWidget> createState() => _AddIngredientWidgetState();
}

class _AddIngredientWidgetState extends State<AddIngredientWidget> {
  final _nameIngredientController = TextEditingController();
  final _amountIngredientController = TextEditingController();
  final _unitIngredientController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.callback(Ingredient(
          id: widget.id,
          name: _nameIngredientController.text,
          quantity: _amountIngredientController.text,
          unit: _unitIngredientController.text,
          isDone: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DragButton(),
            InputWidget(
              textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
              controller: _nameIngredientController,
              inputType: TextInputType.name,
              width: width * 0.3,
              label: Strings.recipeIngredientName,
            ),
            InputWidget(
              textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
              controller: _amountIngredientController,
              inputType: TextInputType.number,
              width: width * 0.18,
              label: Strings.recipeLableAmount,
            ),
            InputWidget(
              textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
              controller: _unitIngredientController,
              inputType: TextInputType.text,
              width: width * 0.14,
              label: Strings.recipeLableUnit,
            ),
            const RemoveButton(),
          ],
        ),
        const SizedBox(
          height: TSizes.space_16,
        ),
      ],
    );
  }
}
