import 'package:cookhub_frontend/app/modules/home/home_controller.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slide_item.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slider_widget.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${Strings.hello}, Hieu',
              style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                color: ColorSelect.gray_100,
              ),
            ),
            SvgPicture.asset(
              TIcons.bellIcon,
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          height: 80,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
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
                  SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.space_16,
              ),
              SliderWidget(),
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
              SliderWidget(),
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
              SliderWidget(),
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
              SliderWidget(),
              const SizedBox(
                height: TSizes.space_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
