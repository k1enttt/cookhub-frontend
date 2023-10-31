import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.btnTitle,
    required this.btnIcon,
    required this.btnBorder,
    required this.btnBackground,
    required this.labelColor,
  });

  final String btnTitle;
  final Widget btnIcon;
  final Color btnBorder;
  final Color btnBackground;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: TSizes.defaultBtnH,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: btnBackground,
            side: BorderSide(
              width: 1.2,
              color: btnBorder,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: btnIcon,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  btnTitle,
                  textAlign: TextAlign.center,
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
