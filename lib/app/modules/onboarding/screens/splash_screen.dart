import 'package:cookhub_frontend/core/values/colors.dart';
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
            'assets/images/logo.svg',
            semanticsLabel: 'Cookhub Logo',
            width: 136,
            height: 136,
          ),
        ),
      ),
    );
  }
}
