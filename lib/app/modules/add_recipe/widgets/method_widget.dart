import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SvgPicture.asset(
                    TIcons.dragIcon,
                    width: TSizes.space_24,
                    height: TSizes.space_24,
                  ),
                ],
              ),
              InputWidget(
                controller: _descriptionController,
                width: buttonWidth,
                height: null,
                label: Strings.recipeDescription,
                inputType: TextInputType.text,
              ),
              SvgPicture.asset(
                TIcons.closeIcon,
                width: TSizes.space_24,
                height: TSizes.space_24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
