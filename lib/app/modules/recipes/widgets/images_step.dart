import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:flutter/material.dart';

class StepImages extends StatelessWidget {
  const StepImages({super.key, required this.steps, required this.index});
  final List<RecipeStep> steps;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      direction: Axis.horizontal,
      children: List.generate(
        steps[index].images.length,
        (indexImg) => SizedBox(
          width: screenWidth / 4,
          child: Image(
            image: AssetImage(steps[index].images[indexImg]),
          ),
        ),
      ),
    );
  }
}
