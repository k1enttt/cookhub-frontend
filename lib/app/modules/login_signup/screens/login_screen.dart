import 'package:cookhub_frontend/app/modules/home/screens/home_screen.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _goToHomePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          ClipRect(
            child: Image.asset(
              TImages.loginImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(
              0.00,
              1.00,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: TSizes.space_80,
                      ),
                      SvgPicture.asset(
                        TImages.logoCircle,
                        semanticsLabel: 'CookHub Logo',
                      ),
                      const SizedBox(
                        height: TSizes.space_56,
                      ),
                      Text(
                        'Hi home cook,',
                        style: TTextTheme.lightTextTheme.displayLarge,
                      ),
                      Text(
                        'Welcome to CookHub',
                        style: TTextTheme.lightTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultButton(
                          btnTitle: 'Continue with Google',
                          btnIcon: SvgPicture.asset(TImages.googleLogo),
                          btnBackground: Colors.transparent,
                          btnBorder: Colors.white,
                          labelColor: Colors.white,
                          goToHomePage: () {},
                        ),
                        DefaultButton(
                          btnTitle: 'Continue with Facebook',
                          btnIcon: SvgPicture.asset(TImages.facebookLogo),
                          btnBackground: Colors.transparent,
                          btnBorder: Colors.white,
                          labelColor: Colors.white,
                          goToHomePage: () {},
                        ),
                        DefaultButton(
                          btnTitle: 'Continue with Email',
                          btnIcon: SvgPicture.asset(TIcons.mailIcon),
                          btnBackground: Colors.transparent,
                          btnBorder: Colors.white,
                          labelColor: Colors.white,
                          goToHomePage: () {},
                        ),
                        DefaultButton(
                          btnTitle: 'Continue as guest',
                          btnIcon: Container(),
                          btnBackground: Colors.white,
                          btnBorder: Colors.transparent,
                          labelColor: ColorSelect.textColor,
                          goToHomePage: _goToHomePage,
                        ),
                        const SizedBox(
                          height: TSizes.space_8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style:
                                  TTextTheme.lightTextTheme.bodySmall!.copyWith(
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(TSizes.space_8),
                                child: Text(
                                  'Log in',
                                  style: TTextTheme.lightTextTheme.bodySmall!
                                      .copyWith(
                                    color: ColorSelect.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorSelect.primaryColor,
                                    decorationThickness: 2,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.space_32,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
