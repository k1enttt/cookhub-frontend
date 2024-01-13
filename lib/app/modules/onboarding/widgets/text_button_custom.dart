import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({
    super.key,
    required this.contentTextBtn,
    required this.skipOnboarding,
  });

  final String contentTextBtn;
  final void Function() skipOnboarding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: contentTextBtn != '' ? skipOnboarding : null,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.space_8),
        child: Text(contentTextBtn,
            style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationThickness: 1,
              letterSpacing: 0.2,
            )),
      ),
    );
  }
}
