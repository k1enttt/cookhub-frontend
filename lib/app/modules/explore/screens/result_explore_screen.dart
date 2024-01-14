import 'package:cookhub_frontend/app/modules/recipes/screens/recipes_screen.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:cookhub_frontend/app/modules/explore/widgets/search_bar.dart';
import 'package:get/get.dart';

class ResultExploreScreen extends StatelessWidget {
  const ResultExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isBookmark = false.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: ColorSelect.primaryColor,
            size: TSizes.heading_20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Explore',
                  style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.space_24,
              ),
              const SearchBarWidget(),
              const SizedBox(
                height: TSizes.space_24,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(const RecipesScreen(), arguments: {
                          'isRecipeDetail': null,
                          'isDone': null,
                          'haveIngredients': null,
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/home/food_1.png",
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // DISH NAME
                                  const Text(
                                    "Homemade pizza",
                                    style: CustomTextStyles.largeBoldStyle,
                                  ),
                                  // TAG
                                  Text(
                                    "| Tag here",
                                    style: CustomTextStyles.smallStyle.copyWith(
                                        color: ColorSelect.secondaryColor),
                                  ),
                                  // RATING
                                  const SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_border,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "4.6",
                                          style: CustomTextStyles.smallStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // AUTHOR
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Nguyen Huu Hieu",
                                          style: CustomTextStyles.smallStyle
                                              .copyWith(
                                            color: ColorSelect.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  debugPrint("Bookmark button pressed");
                                  isBookmark.value = !isBookmark.value;
                                },
                                child: (isBookmark.value)
                                    ? const Icon(
                                        Icons.bookmark,
                                        size: 16,
                                      )
                                    : const Icon(
                                        Icons.bookmark_border,
                                        size: 16,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
