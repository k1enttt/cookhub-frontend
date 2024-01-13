import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopNavigator extends StatelessWidget {
  const TopNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.5),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Icon 3 chấm ở màn hình chi tiết món ăn
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.5),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
    );
  }
}
