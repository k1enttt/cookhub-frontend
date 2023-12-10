import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: ColorSelect.primaryColor,
        strokeWidth: 2,
        dashPattern: const [8, 8],
        borderType: BorderType.RRect,
        radius: const Radius.circular(
          TSizes.space_24,
        ),
        child: Container(
          width: 353,
          height: 160,
          decoration: BoxDecoration(
            color: ColorSelect.gray_400,
            borderRadius: BorderRadius.circular(
              TSizes.space_24,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                TImages.hat,
              ),
              const SizedBox(
                height: TSizes.space_16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  const SizedBox(
                    width: TSizes.space_8,
                  ),
                  Text(
                    'Add cover image',
                    style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                      color: ColorSelect.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
