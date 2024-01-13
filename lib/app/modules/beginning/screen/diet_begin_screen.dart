import 'package:cookhub_frontend/app/modules/beginning/data/beginning_data.dart';
import 'package:cookhub_frontend/app/modules/beginning/screen/favor_begin_screen.dart';
import 'package:cookhub_frontend/app/modules/beginning/widget/dietary_widget.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/extensions/capitalize_first.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DietBeginScreen extends StatefulWidget {
  const DietBeginScreen({super.key});

  @override
  State<DietBeginScreen> createState() => _DietBeginScreenState();
}

class _DietBeginScreenState extends State<DietBeginScreen> {
  final _dietariesData = beginningData.dietariesList;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.space_16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      TSizes.space_8,
                    ),
                    child: SvgPicture.asset(
                      TIcons.closeFillIcon,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotGreyIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotFillIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotGreyIcon),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  Strings.dietaryBeginTitle,
                  style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ..._dietariesData.map(
                (allergy) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: DietWidget(
                    title: allergy["tag"]?.capitalize(),
                    imageSrc: allergy["imageSrc"],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButton(
                        btnTitle: Strings.backBeginBtn,
                        width: width * 0.36,
                        btnIcon: Container(),
                        btnBackground: ColorSelect.gray_300,
                        btnBorder: Colors.transparent,
                        labelColor: ColorSelect.gray_100,
                        onClick: () {
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                      DefaultButton(
                        btnTitle: Strings.nextBeginBtn,
                        width: width * 0.36,
                        btnIcon: Container(),
                        btnBackground: ColorSelect.primaryColor,
                        btnBorder: Colors.transparent,
                        labelColor: Colors.white,
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const FavorBeginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
