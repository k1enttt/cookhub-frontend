import 'package:cookhub_frontend/app/modules/login_signup/screens/login_screen.dart';
import 'package:cookhub_frontend/app/modules/onboarding/models/onboarding_model.dart';
import 'package:cookhub_frontend/app/modules/onboarding/widgets/text_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/app/modules/onboarding/data/onboarding_data.dart';
import 'package:cookhub_frontend/app/modules/onboarding/widgets/onboarding_content.dart';

import '../../../../core/constants/sizes.dart';
import '../widgets/default_button.dart';
import '../widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _nextToLoginPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (ctx) => const LoginScreen()),
      (route) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            itemBuilder: (BuildContext context, int index) {
              OnboardingModel content = onboardingData[index];
              return OnboardingContent(onboardingData: content);
            },
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.space_16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex != 0
                      ? SafeArea(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: TSizes.space_16,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  _pageController.previousPage(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.linear,
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                    TSizes.space_8,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                    size: TSizes.smallIcon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int index = 0;
                              index < onboardingData.length;
                              index++)
                            DotIndicator(
                              isSelected: index == _currentIndex,
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.space_24,
                      ),
                      DefaultButton(
                        contentBtn: _currentIndex == onboardingData.length - 1
                            ? 'Get started'
                            : 'Continue',
                        nextPage: () {
                          if (_currentIndex == onboardingData.length - 1) {
                            // Link to Login / Home page
                            _nextToLoginPage();
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              curve: Curves.linear,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: TSizes.space_16,
                      ),
                      _currentIndex != onboardingData.length - 1
                          ? TextButtonCustom(
                              contentTextBtn: 'Skip',
                              skipOnboarding: _nextToLoginPage,
                            )
                          : TextButtonCustom(
                              contentTextBtn: '',
                              skipOnboarding: () {},
                            ),
                      const SizedBox(
                        height: TSizes.space_32,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
