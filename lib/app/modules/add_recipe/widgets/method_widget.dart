import 'dart:io';

import 'package:cookhub_frontend/app/modules/add_recipe/widgets/drag_button.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/widgets/remove_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    setState(() {
      _selectedImage = File(returnImage.path);
      // widget.callback(_selectedImage!);
    });
  }

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
                    textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                      color: ColorSelect.textColor,
                    ),
                    controller: _descriptionController,
                    width: buttonWidth,
                    height: null,
                    label: Strings.recipeDescription,
                    inputType: TextInputType.text,
                  ),
                  GestureDetector(
                    onTap: _pickImageFromGallery,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: TSizes.space_8,
                      ),
                      width: 88,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _selectedImage == null
                            ? ColorSelect.gray_400
                            : Colors.transparent,
                        image: _selectedImage != null
                            ? DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: ColorSelect.gray_100,
                        ),
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
