import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.controller,
    this.label = '',
    this.obscureText = false,
    required this.inputType,
    this.width = 0,
    this.height = 48,
    this.maxLength = 50,
    this.maxLine = 1,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType inputType;
  final double width;
  final double height;
  final int maxLength;
  final int maxLine;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorSelect.gray_400,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onChanged: onChanged,
        enabled: true,
        controller: controller,
        maxLength: maxLength.toInt(),
        minLines: 1,
        maxLines: maxLine,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
          color: ColorSelect.textColor,
        ),
        cursorColor: ColorSelect.textColor,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
          counterText: "",
          labelStyle: TTextTheme.lightTextTheme.bodySmall!.copyWith(
            color: ColorSelect.gray_200,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorSelect.gray_300,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorSelect.primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
