import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.buttonTitle,
    required this.width,
    required this.height,
    this.icon,
    this.borderRadius = 0,
    required this.buttonColor,
    required this.contentColor,
  });

  final String buttonTitle;
  final double width;
  final double height;
  final IconData? icon;
  final double borderRadius;
  final Color buttonColor;
  final Color contentColor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Ink(
            color: buttonColor,
            width: width,
            height: height,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: contentColor,
                    ),
                  Text(
                    buttonTitle,
                    style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                      color: contentColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
