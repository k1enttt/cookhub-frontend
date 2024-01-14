import 'dart:async';

import 'package:cookhub_frontend/app/modules/home/screens/home_screen.dart';
import 'package:cookhub_frontend/app/modules/onboarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () async {
        await IsFirstRun.isFirstRun() == true
            ? Get.offAll(() => OnboardingScreen())
            : Get.offAll(() => HomeScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
