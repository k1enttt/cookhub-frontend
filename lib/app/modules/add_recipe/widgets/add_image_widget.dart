import 'package:cookhub_frontend/app/modules/add_recipe/screen/add_recipe_screen.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

typedef void FileCallback(File val);

class AddImageWidget extends StatefulWidget {
  final FileCallback callback;
  const AddImageWidget({required this.callback, super.key});

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  File? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    setState(() {
      _selectedImage = File(returnImage.path);
      widget.callback(_selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _pickImageFromGallery();
        },
        child: DottedBorder(
          color: ColorSelect.primaryColor,
          strokeWidth: 2,
          dashPattern: const [8, 8],
          borderType: BorderType.RRect,
          radius: const Radius.circular(
            TSizes.space_24,
          ),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: _selectedImage == null
                  ? ColorSelect.gray_400
                  : Colors.transparent,
              image: _selectedImage != null
                  ? DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
              borderRadius: BorderRadius.circular(
                TSizes.space_24,
              ),
            ),
            child: _selectedImage == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        TImages.hat,
                      ),
                      const SizedBox(
                        height: TSizes.space_16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                          ),
                          const SizedBox(
                            width: TSizes.space_8,
                          ),
                          Text(
                            'Add cover image',
                            style: TTextTheme.lightTextTheme.headlineMedium!
                                .copyWith(
                              color: ColorSelect.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
