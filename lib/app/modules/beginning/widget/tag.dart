import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  const Tag({
    super.key,
    this.title = '',
    this.imageSrc = '',
  });

  final String? title;
  final String? imageSrc;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClick = !isClick;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorSelect.secondaryColor),
          borderRadius: BorderRadius.circular(32),
          color: isClick ? ColorSelect.secondaryColor : null,
        ),
        child: Text(
          widget.title!,
          style: TextStyle(
            color: isClick ? Colors.white : ColorSelect.textColor,
          ),
        ),
      ),
    );
  }
}
