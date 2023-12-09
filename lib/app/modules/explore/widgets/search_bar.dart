import 'package:cookhub_frontend/app/modules/explore/screens/filter_screen.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: ColorSelect.primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                color: ColorSelect.primaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                Strings.searchBarTitle,
                style: TextStyle(
                  color: ColorSelect.gray_200,
                  fontSize: TSizes.bodyNormal,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => print('Hello'),
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border(
                  left: BorderSide(
                    color: ColorSelect.gray_400,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const FilterScreen(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  TIcons.adjustIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
