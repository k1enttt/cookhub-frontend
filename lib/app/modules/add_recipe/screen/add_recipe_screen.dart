import 'package:cookhub_frontend/app/modules/add_recipe/widgets/add_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Upload recipe',
              style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.space_24,
          ),
          const AddImageWidget(),
          Text(
            'Quick search',
            style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
              color: ColorSelect.textColor,
            ),
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          Text(
            'Popular tags',
            style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
              color: ColorSelect.textColor,
            ),
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
        ],
      ),
    );
  }
}
