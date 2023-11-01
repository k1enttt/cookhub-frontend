import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorSelect.primaryColor,
              ),
        ),
      ),
      body: Center(
        child: Text(
          'HomeScreen is working',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorSelect.primaryColor,
              ),
        ),
      ),
    );
  }
}
