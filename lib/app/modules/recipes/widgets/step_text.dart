import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:flutter/material.dart';

class StepText extends StatelessWidget {
  const StepText({super.key, required this.steps, required this.index});
  final List<RecipeStep> steps;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        'Step ${index + 1}: ${steps[index].text}',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
    );
  }
}
