import 'package:flutter/material.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slide_item.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 10; i++) SliderItem(),
        ],
      ),
    );
  }
}
