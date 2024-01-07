import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    this.controller,
    this.label = '',
    this.obscureText = false,
    required this.inputType,
    this.width = 0,
    this.height,
    this.maxLength,
    this.maxLine = 1,
    this.onChanged,
    this.time,
    this.textAlign = TextAlign.start,
    required this.textStyle,
    this.inputFormatter,
  });

  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final TextInputType inputType;
  final double width;
  final double? height;
  final int? maxLength;
  final int maxLine;
  final bool? time;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final List<TextInputFormatter>? inputFormatter;

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
        inputFormatters: inputFormatter,
        onChanged: onChanged,
        enabled: true,
        controller: controller,
        maxLength: maxLength?.toInt(),
        minLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: textAlign,
        style: textStyle,
        cursorColor: ColorSelect.textColor,
        decoration: InputDecoration(
          contentPadding: time == true ? const EdgeInsets.only(left: 6) : null,
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
