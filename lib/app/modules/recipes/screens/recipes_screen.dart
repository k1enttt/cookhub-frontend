import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/app/data/models/tag.dart';
import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/comment_text.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/ingredient_item.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_images.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_text.dart';
import 'package:cookhub_frontend/core/values/fonts.dart';
import 'package:cookhub_frontend/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipesController controller = Get.put(RecipesController());
    double screenWidth = MediaQuery.of(context).size.width;

    // Font
    TextStyle heading2Style = CustomFonts.heading2Style;
    TextStyle mediumStyle = CustomFonts.mediumStyle;
    TextStyle normalStyle = CustomFonts.normalStyle;

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

            // Tựa đề
            // Thời gian nấu | Độ khó | Đánh giá
            Text(
              dishName,
              textAlign: TextAlign.center,
              style: heading2Style,
            ),
            Text(
              "${cookingDuration.time} ${cookingDuration.unit} | $cookingLevel | $rating ($reviewQuantity reviews)",
              textAlign: TextAlign.center,
              style: normalStyle,
            ),

            // Tags
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: List.generate(
                tags.length,
                (tagIndex) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    tags[tagIndex].name,
                    style: normalStyle,
                  ),
                ),
              ),
            ),

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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Text(
                      'Follow',
                      style: normalStyle,
                    ),
                  )
                ],
              ),
            ),

            // Mô tả
            Text(
              dishDescription,
              style: normalStyle,
            ),

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
                        style: mediumStyle,
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
                        style: mediumStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Các bước chi tiết
            (isStepsViewOrIngredientsView.value == true)
                ? (steps.isEmpty
                    ? Text(
                        'No steps',
                        style: normalStyle,
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

                                // Images
                                (steps[index].images.isEmpty)
                                    ? Container()
                                    // Có 1 ảnh
                                    : (steps[index].images.length == 1)
                                        ? SizedBox(
                                            width: screenWidth,
                                            child: Image(
                                              image: AssetImage(
                                                  steps[index].images[0]),
                                            ),
                                          )
                                        :
                                        // Nhiều hơn 1 ảnh
                                        StepImages(steps: steps, index: index),
                              ],
                            );
                          },
                        ),
                      ))
                :

                // Thành phần chi tiết
                SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Số lượng phần ăn được phục vụ
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'How many servings?',
                                style: normalStyle,
                              ),

                              // Quantity and button to increase/decrease
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: decreaseDishQuantity,
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          size: 16,
                                          color: Colors.green,
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
                                          Icons.add_circle_outline,
                                          size: 16,
                                          color: Colors.green,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Số lượng gia vị
                        SizedBox(
                          width: screenWidth,
                          child: Text(
                            "$ingredientQuantity ingredients",
                            textAlign: TextAlign.left,
                            style: mediumStyle,
                          ),
                        ),

                        // Danh sách các thành phần
                        (ingredients.isEmpty)
                            ? Text(
                                'No ingredients',
                                style: normalStyle,
                              )
                            : (ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ingredients.length,
                                itemBuilder: (context, index) {
                                  return IngredientItem(
                                      ingredients: ingredients, index: index);
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
              style: mediumStyle,
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!, width: 3.0),
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
                          return CommentText(comments: comments, index: index);
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
