import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.contentBtn,
    required this.nextPage,
  });

  final String contentBtn;
  final void Function() nextPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSizes.defaultBtnW,
      height: TSizes.defaultBtnH,
      child: ElevatedButton(
        onPressed: nextPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorSelect.primaryColor,
          foregroundColor: Colors.white,
        ),
        child: Text(
          contentBtn,
          style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
