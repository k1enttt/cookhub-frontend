import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            SvgPicture.asset(
              TIcons.dragIcon,
              width: TSizes.space_24,
              height: TSizes.space_24,
            ),
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
            SvgPicture.asset(
              TIcons.closeIcon,
              width: TSizes.space_24,
              height: TSizes.space_24,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.space_16,
        ),
      ],
    );
  }
}
