import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:cookhub_frontend/app/modules/recipes/screens/recipes_screen.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SliderItem extends StatelessWidget {
  HomeModel itemData;
  SliderItem(
    this.itemData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const RecipesScreen(), arguments: {
          'isRecipeDetail': null,
          'isDone': null,
          'haveIngredients': null,
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.space_8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                itemData.imageUrl == ''
                    ? Image.asset(
                        TImages.avatarDefault,
                        width: 168,
                        height: 168,
                      )
                    // : Image.network(
                    //     widget.itemData.imageUrl,
                    //     width: 168,
                    //     height: 168,
                    //   ),
                    : Image.asset(
                        TImages.avatarDefault,
                        width: 168,
                        height: 168,
                      ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorSelect.gray_400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${itemData.time} min.',
                      style: TextStyle(
                        color: ColorSelect.textColor,
                        fontSize: TSizes.bodyNormal,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorSelect.gray_400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          TIcons.starIcon,
                          width: 12,
                          height: 12,
                        ),
                        Text(
                          '${itemData.rate}',
                          style: TextStyle(
                            color: ColorSelect.textColor,
                            fontSize: TSizes.bodyNormal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                '${itemData.title}',
                softWrap: true,
                style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        TImages.avatarDefault,
                      ),
                      backgroundColor: ColorSelect.gray_100,
                    ),
                  ),
                ),
                Text(
                  '${itemData.name}',
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
