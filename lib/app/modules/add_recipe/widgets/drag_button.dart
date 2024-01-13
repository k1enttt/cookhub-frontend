import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DragButton extends StatelessWidget {
  const DragButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        child: SvgPicture.asset(
          TIcons.dragIcon,
          width: TSizes.space_24,
          height: TSizes.space_24,
        ),
      ),
    );
  }
}
