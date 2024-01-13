import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AdjustButton extends StatelessWidget {
  const AdjustButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: TSizes.space_24,
        height: TSizes.space_24,
        decoration: BoxDecoration(
          color: ColorSelect.gray_300,
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
              color: ColorSelect.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
