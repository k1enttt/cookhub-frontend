import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingDayPopup extends StatelessWidget {
  const ShoppingDayPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedValue = 'Today'.obs;
    void changeSelectedValue(String newValue) {
      selectedValue.value = newValue;
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          height: 353,
          width: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/shopping_basket.png"),
              const SizedBox(
                height: 24,
              ),
              // TEXT
              const Text(
                "Select shopping day",
                style: CustomTextStyles.normalStyle,
              ),
              const SizedBox(height: 16),
              // DROPDOWN BUTTON
              Obx(
                () {
                  return Container(
                    width: 196,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue.value,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: CustomColor.primary,
                      ),
                      // iconDisabledColor: Colors.transparent,
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      style: const TextStyle(color: CustomColor.gray1),
                      focusColor: CustomColor.primary, // color of selected item
                      dropdownColor: Colors.white,
                      alignment: Alignment.centerLeft,
                      underline: Container(),
                      onChanged: (String? newValue) {
                        changeSelectedValue(newValue!);
                      },
                      items: <String>['Today', 'Tomorrow']
                          .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: CustomTextStyles.normalStyle
                                    .copyWith(color: CustomColor.gray1)),
                          );
                        },
                      ).toList(),
                      selectedItemBuilder: (context) {
                        return <String>['Today', 'Tomorrow']
                            .map<Widget>((String item) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item,
                              style: CustomTextStyles.normalStyle.copyWith(
                                color: CustomColor.primary,
                              ),
                            ),
                          );
                        }).toList();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              // CONFIRM BUTTON
              GestureDetector(
                onTap: () => Get.back(
                  result: selectedValue.value,
                ), // Kết quả trả về là ngày nấu
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
