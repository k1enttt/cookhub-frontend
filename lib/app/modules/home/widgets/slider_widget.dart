import 'package:cookhub_frontend/app/modules/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slide_item.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, required this.postData});
  final List<HomeModel> postData;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late List<HomeModel> postData = widget.postData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < postData.length; i++)
            SliderItem(
              itemData: postData[i],
            ),
        ],
      ),
    );
  }
}
