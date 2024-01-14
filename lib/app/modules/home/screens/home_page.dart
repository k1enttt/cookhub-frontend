import 'package:cookhub_frontend/app/global_widgets/card_skeleton_home.dart';
import 'package:cookhub_frontend/app/modules/home/controllers/recipe_home_controller.dart';
import 'package:cookhub_frontend/app/modules/home/screens/show_all_screen.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slider_widget.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecipeHomeController _controller = Get.find<RecipeHomeController>();

  Future _refresh() async {
    setState(() {});
    await _controller.fetchAllData();
    setState(() {});
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    Widget twoSkeletonRow = const SizedBox(
      child: Row(
        children: [
          CardSkeletonHome(),
          SizedBox(
            width: 8,
          ),
          CardSkeletonHome(),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: SingleChildScrollView(
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => ShowAllHomeScreen(
                          title: "Trending now",
                        ));
                  },
                  child: SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            (!_controller.isLoading.value)
                ? SliderWidget(_controller)
                : twoSkeletonRow,
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => ShowAllHomeScreen(
                          title: "For you",
                        ));
                  },
                  child: SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            (!_controller.isLoading.value)
                ? SliderWidget(_controller)
                : twoSkeletonRow,
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => ShowAllHomeScreen(
                          title: "Cooks you may like",
                        ));
                  },
                  child: SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            (!_controller.isLoading.value)
                ? SliderWidget(_controller)
                : twoSkeletonRow,
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => ShowAllHomeScreen(
                          title: "Discover",
                        ));
                  },
                  child: SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            (!_controller.isLoading.value)
                ? SliderWidget(_controller)
                : twoSkeletonRow,
            const SizedBox(
              height: TSizes.space_16,
            ),
            (!_controller.isLoading.value)
                ? SliderWidget(_controller)
                : twoSkeletonRow,
            const SizedBox(
              height: TSizes.space_72,
            ),
          ],
        ),
      ),
    );
  }
}
