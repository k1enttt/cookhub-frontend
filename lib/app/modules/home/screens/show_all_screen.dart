import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllHomeScreen extends StatelessWidget {
  const ShowAllHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isBookmark = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        debugPrint("Back button pressed");
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Expanded(
                      child: Text(
                        "Title of the page",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.heading3Style,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 16),
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
                                Text(
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
                                SizedBox(
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
