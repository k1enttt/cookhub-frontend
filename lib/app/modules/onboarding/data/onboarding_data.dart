import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/app/modules/onboarding/models/onboarding_model.dart';

const onboardingData = [
  OnboardingModel(
    title: 'Welcome to\nCookHub',
    subTitle:
        'Explore thousands of mouthwatering recipes, sharpen your cooking skills, and discover new flavors.',
    imageUrl: TImages.onBoardingWelcome,
  ),
  OnboardingModel(
    title: 'Create your\npersonal cookbook',
    subTitle:
        'Create your own unique recipes and share them with fellow food enthusiasts. Inspire and be inspired!',
    imageUrl: TImages.onBoardingCookbook,
  ),
  OnboardingModel(
    title: 'Hassle-free\ngrocery shopping',
    subTitle:
        'Effortlessly store your favorite recipes in your personal cookbook and simplify your grocery shopping experience.',
    imageUrl: TImages.onBoardingShopping,
  )
];
