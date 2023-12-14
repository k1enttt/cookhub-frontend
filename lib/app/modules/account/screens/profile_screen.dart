import 'package:cookhub_frontend/app/modules/account/widgets/button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> tabsTitle = [
    "My recipe",
    "Saved recipe",
  ];

  int current = 0;
  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 78;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    double heightHeader = heightScreen * 0.26;
    return Scaffold(
      body: SizedBox(
        height: heightHeader,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Nguyen Huu Hieu',
                        style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
                          color: ColorSelect.primaryColor,
                        ),
                      ),
                      SvgPicture.asset(
                        TIcons.settingIcon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.space_24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 88,
                        width: 88,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            TImages.avatar_1Image,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.6,
                        height: heightScreen * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '4',
                                      style: TTextTheme
                                          .lightTextTheme.displaySmall!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                    Text(
                                      ' Recipes',
                                      style: TTextTheme
                                          .lightTextTheme.bodyMedium!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: TTextTheme
                                          .lightTextTheme.displaySmall!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TTextTheme
                                          .lightTextTheme.bodyMedium!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: TTextTheme
                                          .lightTextTheme.displaySmall!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                    Text(
                                      'Following',
                                      style: TTextTheme
                                          .lightTextTheme.bodyMedium!
                                          .copyWith(
                                        color: ColorSelect.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ProfileButton(
                                  buttonTitle: 'Edit profile',
                                  width: 141,
                                  height: 34,
                                  buttonColor: ColorSelect.primaryColor,
                                  contentColor: Colors.white,
                                  borderRadius: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: tabsTitle.length,
              child: TabBar(
                isScrollable: tabsTitle.length >= 4,
                indicatorColor: ColorSelect.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                labelColor: ColorSelect.textColor,
                labelStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                  color: ColorSelect.textColor,
                ),
                tabs: <Widget>[
                  for (int i = 0; i < tabsTitle.length; i++)
                    Tab(
                      child: Text(
                        tabsTitle[i],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
