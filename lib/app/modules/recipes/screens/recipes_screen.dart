import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/cooking_duration.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/app/data/models/tag.dart';
import 'package:cookhub_frontend/app/data/widgets/top_navigator.dart';
import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/ingredient_item_recipe.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/comment_popup.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/row_comment_text.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/images_step.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/shopping_day_popup.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/text_step.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/strings.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipesController controller = Get.put(RecipesController());
    double screenWidth = MediaQuery.of(context).size.width;

    // Font
    TextStyle heading2Style = CustomTextStyles.heading2Style;
    TextStyle mediumStyle = CustomTextStyles.mediumStyle;
    TextStyle blackNormalStyle = CustomTextStyles.normalStyle;
    TextStyle bigTextButton = CustomTextStyles.BigTextButtonStyle.copyWith(
        color: CustomColor.primary);
    TextStyle largeBoldStyle = CustomTextStyles.largeBoldStyle;
    TextStyle whiteNormalStyle = blackNormalStyle.copyWith(color: Colors.white);
    TextStyle textButtonStyle = blackNormalStyle.copyWith(
        color: CustomColor.gray1, decoration: TextDecoration.underline);

    // Data
    String backgroundImg = 'assets/back_image.png';
    String dishName = 'Vietnamese Pho';
    String authorName = 'Nguyễn Hữu Hiệu';
    int authorFollowers = 100;
    String authorAvt = 'assets/author_avt.png';
    String dishDescription =
        'Pho is a Vietnamese soup dish consisting of broth, rice noodles, herbs, and meat.';
    CookingDuration cookingDuration =
        CookingDuration(time: 30, unit: 'minutes');
    String cookingLevel = 'Medium';
    double rating = 4.6;
    int reviewQuantity = 16;
    RxInt dishQuantity = MyData.dishQuantity;
    int ingredientQuantity = 15;
    RxBool isStepsViewOrIngredientsView =
        controller.isStepsViewOrIngredientView;
    List<RecipeStep> steps = controller.steps;
    RxList<Ingredient> ingredients = controller.ingredientsList;
    List<Comment> comments = controller.comments;
    List<Tag> tags = controller.tags;
    RxBool isFollowed = false.obs; // Trạng thái Follow của Author

    // UI
    cookingDurationText(CookingDuration cookingDuration) =>
        Text("${cookingDuration.time} ${cookingDuration.unit}",
            style: blackNormalStyle);
    cookingLevelText(String cookingLevel) =>
        Text(cookingLevel, style: blackNormalStyle);
    ratingText(double rating, int reviewQuantity) =>
        Text("$rating  ($reviewQuantity reviews)", style: blackNormalStyle);

    // Functions
    void stepsOnClick() {
      isStepsViewOrIngredientsView.value = true;
    }

    void ingredientsOnClick() {
      isStepsViewOrIngredientsView.value = false;
    }

    void increaseDishQuantity() {
      dishQuantity.value++;
    }

    void decreaseDishQuantity() {
      if (dishQuantity.value > 0) {
        dishQuantity.value--;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Hình ảnh nền
              Stack(children: [
                Image(
                  image: AssetImage(backgroundImg),
                  width: screenWidth,
                ),
                const TopNavigator(),
              ]),

              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      // Tựa đề
                      Text(
                        dishName,
                        textAlign: TextAlign.center,
                        style: heading2Style,
                      ),
                      const SizedBox(height: 12),

                      // Thời gian nấu | Độ khó | Đánh giá
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            cookingDurationText(cookingDuration),
                            const SizedBox(width: 14),
                            Text("|", style: blackNormalStyle),
                            const SizedBox(width: 14),
                            cookingLevelText(cookingLevel),
                            const SizedBox(width: 14),
                            Text("|", style: blackNormalStyle),
                            const SizedBox(width: 14),
                            const Icon(
                              Icons.star_rate_rounded,
                              size: 16,
                            ),
                            ratingText(rating, reviewQuantity),
                          ],
                        ),
                      ),
                      const SizedBox(height: 21),

                      // Tags
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        children: List.generate(
                          tags.length,
                          (tagIndex) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: CustomColor.secondary),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Text(
                              tags[tagIndex].name,
                              style: blackNormalStyle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tác giả
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(authorAvt),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          authorName,
                                          style: mediumStyle,
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '$authorFollowers followers',
                                          style: blackNormalStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Update UI Follow button when tapped
                                isFollowed.value = !isFollowed.value;
                              },
                              child: (isFollowed.value)
                                  ? Container(
                                      width: 90,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color:
                                                  ColorSelect.secondaryColor)),
                                      child: Text(
                                        'Followed',
                                        textAlign: TextAlign.center,
                                        style: blackNormalStyle,
                                      ),
                                    )
                                  : Container(
                                      width: 90,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: CustomColor.secondary,
                                      ),
                                      child: Text(
                                        'Follow',
                                        textAlign: TextAlign.center,
                                        style: blackNormalStyle,
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),

                      // Mô tả
                      Text(
                        dishDescription,
                        style: blackNormalStyle,
                      ),
                      const SizedBox(height: 26),

                      // Các bước thực hiện && Thành phần - Nút bấm
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: stepsOnClick,
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (isStepsViewOrIngredientsView.value)
                                        ? CustomColor.primary
                                        : CustomColor.gray3,
                                  ),
                                  child: Text(
                                    "Steps",
                                    style: (isStepsViewOrIngredientsView.value)
                                        ? whiteNormalStyle
                                        : blackNormalStyle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: ingredientsOnClick,
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (isStepsViewOrIngredientsView.value)
                                        ? CustomColor.gray3
                                        : CustomColor.primary,
                                  ),
                                  child: Text(
                                    "Ingredients",
                                    style: (isStepsViewOrIngredientsView.value)
                                        ? blackNormalStyle
                                        : whiteNormalStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Các bước chi tiết
                      (isStepsViewOrIngredientsView.value == true)
                          ? (steps.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    'No steps',
                                    style: blackNormalStyle,
                                  ),
                                )
                              : SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const PageScrollPhysics(),
                                    itemCount: steps.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          // Text
                                          StepText(steps: steps, index: index),
                                          const SizedBox(height: 16),

                                          // Images
                                          (steps[index].images.isEmpty)
                                              ? Container()
                                              // Có 1 ảnh
                                              : (steps[index].images.length ==
                                                      1)
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                      width: screenWidth,
                                                      child: Image(
                                                        image: AssetImage(
                                                            steps[index]
                                                                .images[0]),
                                                      ),
                                                    )
                                                  :
                                                  // Nhiều hơn 1 ảnh
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                      child: StepImages(
                                                          steps: steps,
                                                          index: index),
                                                    ),
                                        ],
                                      );
                                    },
                                  ),
                                ))
                          :

                          // Thành phần chi tiết
                          Container(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Số lượng phần ăn được phục vụ
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'How many servings?',
                                          style: blackNormalStyle,
                                        ),

                                        // Quantity and button to increase/decrease
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed:
                                                      decreaseDishQuantity,
                                                  icon: const Icon(
                                                    Icons.remove_circle,
                                                    size: 32,
                                                    color: Colors.orange,
                                                  )),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  dishQuantity.toString(),
                                                  style: mediumStyle,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed:
                                                      increaseDishQuantity,
                                                  icon: const Icon(
                                                    Icons.add_circle,
                                                    size: 32,
                                                    color: Colors.orange,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Số lượng gia vị
                                  SizedBox(
                                    width: screenWidth,
                                    child: Text(
                                      "$ingredientQuantity ingredients",
                                      textAlign: TextAlign.left,
                                      style: largeBoldStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Danh sách các thành phần
                                  (ingredients.isEmpty)
                                      ? Text(
                                          'No ingredients',
                                          style: blackNormalStyle,
                                        )
                                      : (ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: ingredients.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 16),
                                              child: IngredientItemRecipe(
                                                //TODO: Index là số thứ tự thành phần, không truyền vào recipeId được
                                                recipeId: 0,
                                                indexOfIngredient: index,
                                              ),
                                            );
                                          },
                                        )),
                                ],
                              ),
                            ),

                      // Nút xem thêm
                      SizedBox(
                        width: screenWidth,
                        child: TextButton(
                          onPressed: () {
                            // Mở rộng nội dung Steps và Ingredients
                          },
                          child: Text(
                            'View more',
                            style: textButtonStyle,
                          ),
                        ),
                      ),

                      // Add to shopping list button
                      GestureDetector(
                        onTap: () => {
                          // Display Shopping day popup
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ShoppingDayPopup();
                            },
                          ),
                        },
                        child: Container(
                          width: screenWidth,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: CustomColor.primary),
                            // color: CustomColor.primary,
                          ),
                          child: Center(
                            child: Text(
                              'Add to shopping list',
                              style: bigTextButton,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      // Comments
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Comments",
                          style: heading2Style,
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        child: Row(
                          children: [
                            // AUTHOR AVATAR
                            Image(image: AssetImage(authorAvt)),
                            const SizedBox(width: 8),
                            // COMMENT BUTTON
                            Expanded(
                              child: GestureDetector(
                                onTap: () => {
                                  // Display Comment popup
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CommentPopup();
                                    },
                                  ),
                                },
                                child: Container(
                                  // width: screenWidth * 0.74,
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColor.gray2, width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Add your comment here',
                                      style: blackNormalStyle.copyWith(
                                        color: CustomColor.gray1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Danh sách các comment
                      comments.isEmpty
                          ? Text(
                              'No comments',
                              style: blackNormalStyle,
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CommentText(
                                      comments: comments, index: index),
                                );
                              }),

                      // Nút View more comments
                      SizedBox(
                        width: screenWidth,
                        child: TextButton(
                          onPressed: () {
                            // Mở rộng nội dung Comments
                          },
                          child: Text(
                            'View all 1000 comments',
                            style: textButtonStyle,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
