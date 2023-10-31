import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: TSizes.space_8,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: TSizes.space_8,
        width: TSizes.space_8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? ColorSelect.primaryColor : ColorSelect.gray_100,
        ),
      ),
    );
  }
}
