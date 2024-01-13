import 'dart:async';

import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RemoveButton extends StatefulWidget {
  const RemoveButton({super.key});

  @override
  State<RemoveButton> createState() => _RemoveButtonState();
}

class _RemoveButtonState extends State<RemoveButton> {
  Color iconColor = ColorSelect.gray_200;
  Color defaultIconColor = ColorSelect.gray_200;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          iconColor = (iconColor == ColorSelect.gray_200)
              ? Colors.red
              : ColorSelect.gray_200;
        });

        Timer(const Duration(milliseconds: 300), () {
          setState(() {
            iconColor = defaultIconColor;
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 0,
          bottom: 8,
        ),
        child: SvgPicture.asset(
          TIcons.closeIcon,
          width: TSizes.space_24,
          height: TSizes.space_24,
          color: iconColor,
        ),
      ),
    );
  }
}
