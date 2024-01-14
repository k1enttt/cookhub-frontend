import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:cookhub_frontend/app/data/provider/data_center.dart';
import 'package:cookhub_frontend/app/modules/home/controllers/recipe_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slide_item.dart';
import 'package:get/get.dart';

class SliderWidget extends StatelessWidget {
  final RecipeHomeController _controller;
  const SliderWidget(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < _controller.postList.length; i++)
            Obx(
              () => SliderItem(
                _controller.postList[i],
              ),
            ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: DataCenter.instance.homeRecipes.length,
  //     itemBuilder: (context, i) => SliderItem(
  //       _controller.postList[i],
  //     ),
  //   );
  // }
}
