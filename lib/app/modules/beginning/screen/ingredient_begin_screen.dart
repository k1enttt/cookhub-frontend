import 'package:cookhub_frontend/app/modules/beginning/data/beginning_data.dart';
import 'package:cookhub_frontend/app/modules/beginning/screen/diet_begin_screen.dart';
import 'package:cookhub_frontend/app/modules/beginning/widget/tag.dart';
import 'package:cookhub_frontend/core/extensions/capitalize_first.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IngredientBeginScreen extends StatefulWidget {
  const IngredientBeginScreen({super.key});

  @override
  State<IngredientBeginScreen> createState() => _IngredientBeginScreenState();
}

class _IngredientBeginScreenState extends State<IngredientBeginScreen> {
  final _beginningData = beginningData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.space_16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      TSizes.space_8,
                    ),
                    child: SvgPicture.asset(
                      TIcons.closeFillIcon,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotFillIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotGreyIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.space_8,
                    ),
                    child: SvgPicture.asset(TIcons.carrotGreyIcon),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                Strings.ingredientBeginTitle,
                style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                  color: ColorSelect.textColor,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Wrap(
                children: [
                  ..._beginningData.allergiesList.map(
                    (allergy) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Tag(
                        title: allergy["tag"]?.capitalize(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButton(
                    btnTitle: Strings.nextBeginBtn,
                    width: double.infinity,
                    btnIcon: Container(),
                    btnBackground: ColorSelect.primaryColor,
                    btnBorder: Colors.transparent,
                    labelColor: Colors.white,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const DietBeginScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
