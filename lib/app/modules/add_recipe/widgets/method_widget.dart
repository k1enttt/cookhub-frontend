import 'package:cookhub_frontend/app/modules/add_recipe/widgets/drag_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/remove_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';

class MethodWidget extends StatefulWidget {
  const MethodWidget({
    super.key,
    required this.numberTitle,
  });

  final String numberTitle;

  @override
  State<MethodWidget> createState() => _MethodWidgetState();
}

class _MethodWidgetState extends State<MethodWidget> {
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.7;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: TSizes.space_8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: ColorSelect.gray_300,
                      ),
                      child: Center(
                        child: Text(widget.numberTitle),
                      ),
                    ),
                  ),
                  const DragButton(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputWidget(
                    controller: _descriptionController,
                    width: buttonWidth,
                    height: null,
                    label: Strings.recipeDescription,
                    inputType: TextInputType.text,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: TSizes.space_8,
                    ),
                    width: 88,
                    height: 64,
                    decoration: BoxDecoration(
                      color: ColorSelect.gray_400,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: ColorSelect.gray_100,
                      ),
                    ),
                  )
                ],
              ),
              const RemoveButton(),
            ],
          ),
        ],
      ),
    );
  }
}
