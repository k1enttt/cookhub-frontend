import 'package:cookhub_frontend/app/modules/explore/data/food_tag_data.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/button.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/popular_tag.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: ColorSelect.primaryColor,
            size: TSizes.heading_20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Filter',
                style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.cookTime,
                  style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                Text(
                  '${_value.toInt()} min',
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: ColorSelect.primaryColor,
                trackHeight: 6,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12,
                ),
              ),
              child: Slider(
                value: _value,
                activeColor: ColorSelect.primaryColor,
                inactiveColor: ColorSelect.gray_300,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (value) => setState(
                  () {
                    _value = value;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Text(
              Strings.difficultyTitle,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Wrap(
              children: [
                ...foodTagData.map(
                  (tagItem) => tagItem.type == 'difficulty'
                      ? PopularTag(
                          title: tagItem.title,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Text(
              Strings.dishTypeTitle,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Wrap(
              children: [
                ...foodTagData.map(
                  (tagItem) => tagItem.type == 'dish'
                      ? PopularTag(
                          title: tagItem.title,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Text(
              Strings.cuisineTitle,
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: ColorSelect.textColor,
              ),
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Wrap(
              children: [
                ...foodTagData.map(
                  (tagItem) => tagItem.type == 'cuisine'
                      ? PopularTag(
                          title: tagItem.title,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.seeMore,
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.gray_100,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: ColorSelect.gray_100,
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(
                bottom: TSizes.space_16,
              ),
              child: const MyButton(),
            ),
          ],
        ),
      ),
    );
  }
}
