import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorSelect.primaryColor,
        child: Center(
          child: SvgPicture.asset(
            TImages.lightAppLogo,
            semanticsLabel: 'Cookhub Logo',
            width: 136,
            height: 136,
          ),
        ),
      ),
    );
  }
}
