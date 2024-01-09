import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

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
              SizedBox(
                height: height * 0.06,
              ),
              Center(
                child: Image.asset(
                  TImages.introductionImage,
                  width: width * 0.8,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Column(
                  children: [
                    Text(
                      Strings.exploreBeginTitle,
                      style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      Strings.exploreBeginDesc,
                      style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              Align(
                child: DefaultButton(
                  btnTitle: Strings.startedBeginBtn,
                  width: double.infinity,
                  btnIcon: Container(),
                  btnBackground: ColorSelect.primaryColor,
                  btnBorder: Colors.transparent,
                  labelColor: Colors.white,
                  onClick: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
