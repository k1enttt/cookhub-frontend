import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        print("Hello"),
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: TSizes.space_8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              TImages.food_1Image,
              width: 168,
              height: 168,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                'Homemade Pizza',
                style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 4,
                  ),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        TImages.avatar_1Image,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Nguyen Huu Hieu',
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
