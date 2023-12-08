import 'package:cookhub_frontend/app/modules/home/widgets/slider_widget.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'What would you like\nto cook today?',
              style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.space_24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending now',
                style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                TIcons.arrow_left_smIcon,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          const SliderWidget(),
          const SizedBox(
            height: TSizes.space_16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For you',
                style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                TIcons.arrow_left_smIcon,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          const SliderWidget(),
          const SizedBox(
            height: TSizes.space_16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cooks you may like',
                style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                TIcons.arrow_left_smIcon,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          const SliderWidget(),
          const SizedBox(
            height: TSizes.space_16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover',
                style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                TIcons.arrow_left_smIcon,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.space_16,
          ),
          const SliderWidget(),
          const SizedBox(
            height: TSizes.space_16,
          ),
          const SliderWidget(),
          const SizedBox(
            height: TSizes.space_72,
          ),
        ],
      ),
    );
  }
}
