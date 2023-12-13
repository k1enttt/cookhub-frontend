import 'package:cookhub_frontend/app/modules/account/widgets/button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    double heightHeader = heightScreen * 0.3;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: heightHeader,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Nguyen Huu Hieu',
                        style: TTextTheme.lightTextTheme.displaySmall!.copyWith(
                          color: ColorSelect.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.20,
                      ),
                      SvgPicture.asset(
                        TIcons.settingIcon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.space_16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 88,
                        height: 88,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            TImages.avatar_1Image,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
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
                                    'Recipes',
                                    style: TTextTheme.lightTextTheme.bodyMedium!
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
                                    style: TTextTheme.lightTextTheme.bodyMedium!
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
                                    style: TTextTheme.lightTextTheme.bodyMedium!
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
                                borderRadius: 5,
                                buttonColor: ColorSelect.primaryColor,
                                contentColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
