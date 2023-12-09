import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class QuickSearchWidget extends StatelessWidget {
  const QuickSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 142,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                TImages.lunch,
                width: 80,
                height: 80,
              ),
            ),
            Text(
              Strings.lunch,
              style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
                color: ColorSelect.textColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
