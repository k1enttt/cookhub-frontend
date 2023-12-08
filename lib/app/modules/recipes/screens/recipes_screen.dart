import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/app/data/models/tag.dart';
import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/comment_text.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/ingredient_item.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_images.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_text.dart';
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
    TextStyle normalStyle = CustomTextStyles.normalStyle;
    TextStyle largeBoldStyle = CustomTextStyles.largeBoldStyle;

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
    RxInt dishQuantity = controller.dishQuantity;
    int ingredientQuantity = 15;
    RxBool isStepsViewOrIngredientsView =
        controller.isStepsViewOrIngredientView;
    List<RecipeStep> steps = controller.steps;
    List<Ingredient> ingredients = controller.ingredients;
    List<Comment> comments = controller.comments;
    List<Tag> tags = controller.tags;

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
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Obx(
        () => ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Hình ảnh nền
            Image(
              image: AssetImage(backgroundImg),
              width: screenWidth,
            ),

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
                          Text(
                              "${cookingDuration.time} ${cookingDuration.unit}",
                              style: normalStyle),
                          const SizedBox(width: 14),
                          Text("|", style: normalStyle),
                          const SizedBox(width: 14),
                          Text(cookingLevel, style: normalStyle),
                          const SizedBox(width: 14),
                          Text("|", style: normalStyle),
                          const SizedBox(width: 14),
                          const Icon(
                            Icons.star_border_rounded,
                            size: 16,
                          ),
                          Text(
                            "$rating ($reviewQuantity reviews)",
                            style: normalStyle,
                          ),
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
                            style: normalStyle,
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
                                        style: normalStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: CustomColor.secondary,
                            ),
                            child: Text(
                              'Follow',
                              style: normalStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Mô tả
                    Text(
                      dishDescription,
                      style: normalStyle,
                    ),
                    const SizedBox(height: 26),

                    // Các bước thực hiện && Thành phần - Nút bấm
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: stepsOnClick,
                            child: Container(
                              width: 170,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Text(
                                "Steps",
                                style: normalStyle,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ingredientsOnClick,
                            child: Container(
                              width: 170,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Text(
                                "Ingredients",
                                style: normalStyle,
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
                                  style: normalStyle,
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
                                            : (steps[index].images.length == 1)
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
                                        style: normalStyle,
                                      ),

                                      // Quantity and button to increase/decrease
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: decreaseDishQuantity,
                                                icon: const Icon(
                                                  Icons.remove_circle,
                                                  size: 32,
                                                  color: Colors.orange,
                                                )),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                dishQuantity.toString(),
                                                style: mediumStyle,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: increaseDishQuantity,
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
                                        style: normalStyle,
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
                                            child: IngredientItem(
                                                ingredients: ingredients,
                                                index: index),
                                          );
                                        },
                                      )),
                              ],
                            ),
                          ),

                    // Nút xem thêm
                    TextButton(
                      onPressed: () {
                        // Mở rộng nội dung Steps và Ingredients
                      },
                      child: const Text('View more'),
                    ),

                    // Comments
                    Text(
                      "Comments",
                      style: heading2Style,
                    ),

                    SizedBox(
                        child: Row(
                      children: [
                        Image(image: AssetImage(authorAvt)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controller.commentController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8),
                              hintText: 'Add your comment here',
                              hintStyle: normalStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey[300]!, width: 3.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),

                    // Danh sách các comment
                    comments.isEmpty
                        ? Text(
                            'No comments',
                            style: normalStyle,
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: comments.length,
                                itemBuilder: (context, index) {
                                  return CommentText(
                                      comments: comments, index: index);
                                }),
                          ),
                    // Nút View more comments
                    TextButton(
                      onPressed: () {
                        // Mở rộng nội dung Comments
                      },
                      child: const Text('View all 1000 comments'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class CookingDuration {
  int time;
  String unit;
  CookingDuration({required this.time, required this.unit});
}
