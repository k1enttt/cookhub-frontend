import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatefulWidget {
  const IngredientWidget({
    super.key,
    this.title = '',
    this.imageSrc = '',
  });

  final String? title;
  final String? imageSrc;

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClick = !isClick;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.space_8),
          boxShadow: [
            BoxShadow(
              blurRadius: 32,
              color: ColorSelect.gray_300,
            ),
          ],
          color: Colors.white,
          border: isClick
              ? Border.all(
                  color: ColorSelect.primaryColor,
                  width: 1.4,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: TSizes.space_48,
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.imageSrc!),
                backgroundColor: ColorSelect.gray_400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                widget.title!,
                style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                  color: ColorSelect.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
