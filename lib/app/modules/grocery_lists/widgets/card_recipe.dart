import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.image,
    required this.name,
    required this.totleIngredients,
    required this.haveIngredients,
    required this.isDone,
  });
  final String image;
  final String name;
  final int totleIngredients;
  final int haveIngredients;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    // Color
    const Color secondaryColor = CustomColor.secondary;
    const Color gray1 = CustomColor.gray1;

    // Text style
    TextStyle grayNormalText = CustomTextStyles.normalStyle.copyWith(
      color: gray1,
    );
    const TextStyle recipesName = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      height: 1.3,
    );

    return Card(
      elevation: 0,
      child: ListTile(
        leading: Image.asset(
          image,
          width: 88,
          height: 88,
        ),
        title: Text(
          name,
          style: recipesName,
        ),
        subtitle: Text(
          "$haveIngredients/$totleIngredients ingredients",
          style: grayNormalText,
        ),
        trailing: (isDone)
            ? const Icon(
                Icons.done_rounded,
                color: secondaryColor,
                size: 24,
              )
            : const SizedBox(),
        onTap: () => debugPrint("ListTile pressed"),
      ),
    );
  }
}
