import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PopularTag extends StatelessWidget {
  const PopularTag({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ColorSelect.secondaryColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ColorSelect.textColor,
        ),
      ),
    );
  }
}
