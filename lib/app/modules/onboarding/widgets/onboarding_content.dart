import 'package:flutter/material.dart';
import '../../../../core/constants/sizes.dart';
import 'package:cookhub_frontend/app/modules/onboarding/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.onboardingData,
  });

  final OnboardingModel onboardingData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Image.asset(
            onboardingData.imageUrl,
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
            height: 620,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.space_16,
          ),
          margin: const EdgeInsets.only(
            bottom: 200, // Not responsive
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                onboardingData.title,
                style: Theme.of(context).textTheme.displayLarge,
                maxLines: 2,
              ),
              const SizedBox(
                height: TSizes.space_16,
              ),
              Text(
                onboardingData.subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
