import 'package:cookhub_frontend/app/modules/add_recipe/widgets/drag_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/remove_button.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';

class AddIngredientWidget extends StatefulWidget {
  const AddIngredientWidget({super.key});

  @override
  State<AddIngredientWidget> createState() => _AddIngredientWidgetState();
}

class _AddIngredientWidgetState extends State<AddIngredientWidget> {
  final _nameIngredientController = TextEditingController();
  final _amountIngredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DragButton(),
            InputWidget(
              controller: _nameIngredientController,
              inputType: TextInputType.name,
              width: 136,
              label: Strings.recipeIngredientName,
            ),
            InputWidget(
              controller: _amountIngredientController,
              inputType: TextInputType.number,
              width: 136,
              label: Strings.recipeLableAmount,
            ),
            RemoveButton(),
          ],
        ),
        const SizedBox(
          height: TSizes.space_16,
        ),
      ],
    );
  }
}
