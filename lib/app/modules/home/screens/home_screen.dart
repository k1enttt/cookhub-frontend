import 'package:cookhub_frontend/core/values/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: const Center(
        child: Text(
          'HomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
