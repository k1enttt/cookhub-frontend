import 'package:cookhub_frontend/app/modules/home/home_controller.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/navigation_menu.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
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
      body: NavigationMenu(),
    );
  }
}
