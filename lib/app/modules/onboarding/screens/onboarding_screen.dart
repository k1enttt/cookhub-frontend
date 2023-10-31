import 'package:flutter/material.dart';
import 'package:cookhub_frontend/app/modules/onboarding/data/onboarding_data.dart';
import 'package:cookhub_frontend/app/modules/onboarding/widgets/onboarding_content.dart';

import '../../../../core/constants/sizes.dart';
import '../widgets/button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              ...onboardingData
                  .map((data) => OnboardingContent(
                        onboardingData: data,
                      ))
                  .toList(),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.space_16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: TSizes.space_32,
                ),
                const SizedBox(
                  height: TSizes.space_24,
                ),
                const Button(),
                const SizedBox(
                  height: TSizes.space_8,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Text('Skip'),
                ),
                const SizedBox(
                  height: TSizes.space_32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
