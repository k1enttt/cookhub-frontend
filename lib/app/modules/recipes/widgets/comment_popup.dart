import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentPopup extends StatelessWidget {
  const CommentPopup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    // 5 STAR FUNCTIONS
    // When each star is clicked, the color of the first start to the selected star changes to yellow
    RxInt starIndex = 0.obs;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          height: 334,
          width: 353,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TEXT
              const Text(
                "Rate this recipe",
                style: CustomTextStyles.heading3Style,
              ),
              const SizedBox(height: 16),
              // FIVE STAR
              SizedBox(
                height: 32,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                              onTap: () {
                                // When each star is clicked, the color of the first start to the selected star changes to yellow
                                starIndex.value = index + 1;
                              },
                              child: (index <= starIndex.value - 1)
                                  ? const Icon(
                                      Icons.star_rate,
                                      color: CustomColor.primary,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.star_rate,
                                      color: CustomColor.gray3,
                                      size: 32,
                                    ),
                            ));
                      },
                      separatorBuilder: ((context, _) =>
                          const SizedBox(width: 16)),
                      itemCount: 5,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // COMMENT TEXT FIELD
              SizedBox(
                width: 320,
                height: 96,
                child: Expanded(
                  child: TextField(
                    controller: commentController,
                    style: CustomTextStyles.normalStyle,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Write your comment here...',
                      hintStyle: CustomTextStyles.normalStyle,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColor.gray3,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColor.primary,
                          width: 1.0,
                        ),
                      ),
                    ),
                    maxLines: 5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // CONFIRM BUTTON
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 128,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: CustomColor.primary,
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: CustomTextStyles.BigTextButtonStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
