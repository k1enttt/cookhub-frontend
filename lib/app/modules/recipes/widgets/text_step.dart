import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';

class StepText extends StatelessWidget {
  const StepText({super.key, required this.steps, required this.index});
  final List<RecipeStep> steps;
  final int index;

  @override
  Widget build(BuildContext context) {
    TextStyle whiteNormalStyle =
        CustomTextStyles.normalStyle.copyWith(color: Colors.white);

    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: CustomColor.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: whiteNormalStyle,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              steps[index].text,
              softWrap: true,
              style: CustomTextStyles.normalStyle,
            ),
          ),
        ],
      ),
    );
  }
}
