import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DietWidget extends StatefulWidget {
  const DietWidget({
    super.key,
    this.title = '',
    this.imageSrc = '',
    this.index,
  });

  final String? title;
  final String? imageSrc;
  final int? index;

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
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
          duration: const Duration(
            microseconds: 200,
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.space_48),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: ColorSelect.gray_300,
              ),
            ],
            color: Colors.white,
            border: isClick
                ? Border.all(
                    color: ColorSelect.primaryColor,
                    width: 1.4,
                  )
                : Border.all(
                    color: Colors.white,
                    width: 1.4,
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  widget.title!,
                  style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
              ),
              SizedBox(
                width: TSizes.space_48,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.imageSrc!),
                  backgroundColor: ColorSelect.gray_400,
                ),
              ),
            ],
          )),
    );
  }
}
