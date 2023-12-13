import 'package:cookhub_frontend/app/modules/explore/data/food_tag_data.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/popular_tag.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/search_item.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
              'Explore',
              style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.space_24,
          ),
          const SearchBarWidget(),
          const SizedBox(
            height: TSizes.space_24,
          ),
          Text(
            'Quick search',
            style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
              color: ColorSelect.textColor,
            ),
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          Column(
            children: [
              for (int i = 0; i < 2; i++)
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [for (int i = 0; i < 3; i++) const QuickSearchWidget()],
                  ),
                ),
            ],
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
          Wrap(
            children: [
              ...foodTagData.map(
                (tagItem) => tagItem.type == 'popular'
                    ? PopularTag(
                        title: tagItem.title,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
