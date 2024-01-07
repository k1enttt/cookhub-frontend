import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/login_signup/screens/signup_screen.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                children: [
                  SizedBox(
                    height: _width * 0.15,
                  ),
                  Column(
                    children: [
                      Text(
                        Strings.login,
                        style: TTextTheme.lightTextTheme.displayLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _width * 0.05,
                        ),
                        Text(
                          Strings.usernameTitle,
                          style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.space_8,
                        ),
                        InputWidget(
                          controller: _usernameController,
                          width: double.infinity,
                          height: 48,
                          label: Strings.enterUsername,
                          inputType: TextInputType.text,
                          maxLine: 1,
                        ),
                        const SizedBox(
                          height: TSizes.space_16,
                        ),
                        Text(
                          Strings.passTitle,
                          style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.space_8,
                        ),
                        InputWidget(
                          controller: _passwordController,
                          width: double.infinity,
                          height: 48,
                          label: Strings.enterPassword,
                          inputType: TextInputType.text,
                          maxLine: 1,
                        ),
                        const SizedBox(
                          height: TSizes.space_32,
                        ),
                        DefaultButton(
                          btnTitle: Strings.loginBtnTitle,
                          width: double.infinity,
                          btnIcon: Container(),
                          btnBackground: ColorSelect.primaryColor,
                          btnBorder: Colors.transparent,
                          labelColor: Colors.white,
                          onClick: () {},
                        ),
                        SizedBox(
                          height: _width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _width * 0.28,
                              height: 2,
                              decoration: BoxDecoration(
                                color: ColorSelect.gray_200,
                              ),
                            ),
                            Text(
                              Strings.continueTitle,
                              style: TTextTheme.lightTextTheme.bodyMedium!
                                  .copyWith(
                                color: ColorSelect.gray_200,
                              ),
                            ),
                            Container(
                              width: _width * 0.28,
                              height: 2,
                              decoration: BoxDecoration(
                                color: ColorSelect.gray_200,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.space_8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultButton(
                              btnTitle: '',
                              width: _width * 0.25,
                              btnIcon: SvgPicture.asset(TImages.googleLogo),
                              btnBackground: Colors.white,
                              btnBorder: Colors.transparent,
                              labelColor: Colors.white,
                              onClick: () {},
                            ),
                            const SizedBox(
                              width: TSizes.space_16,
                            ),
                            DefaultButton(
                              btnTitle: '',
                              width: _width * 0.25,
                              btnIcon: SvgPicture.asset(TImages.facebookLogo),
                              btnBackground: Colors.white,
                              btnBorder: Colors.transparent,
                              labelColor: Colors.white,
                              onClick: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.dontHaveAccount,
                              style:
                                  TTextTheme.lightTextTheme.bodySmall!.copyWith(
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(TSizes.space_8),
                                child: Text(
                                  Strings.signup,
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
