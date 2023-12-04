import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/app/data/models/tag.dart';
import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/comment_text.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/ingredient_item.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_images.dart';
import 'package:cookhub_frontend/app/modules/recipes/widgets/step_text.dart';
import 'package:cookhub_frontend/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipesController controller = Get.put(RecipesController());
    double screenWidth = MediaQuery.of(context).size.width;

    RxBool isStepsViewOrIngredientsView =
        controller.isStepsViewOrIngredientView;

    // Data
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
              image: const AssetImage('assets/back_image.png'),
              width: screenWidth,
            ),

            // Tựa đề
            // Thời gian nấu | Độ khó | Đánh giá
            const Text(
              "Vietnamese Pho",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "30 minutes | Medium | 4.6 (16 reviews)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
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
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/author_avt.png'),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Nguyễn Hữu Hiệu",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
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
                    child: const Text('Follow'),
                  )
                ],
              ),
            ),

            // Mô tả
            const Text(
                'Pho is a Vietnamese soup dish consisting of broth, rice noodles, herbs, and meat.'),

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
                      child: const Text(
                        "Steps",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                      child: const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Các bước chi tiết
            (isStepsViewOrIngredientsView.value == true)
                ? (steps.isEmpty
                    ? const Text('No steps')
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
                      children: [
                        // Số lượng phần ăn được phục vụ
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('How many servings?'),

                              // Quantity and button to increase/decrease
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          size: 16,
                                          color: Colors.green,
                                        )),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
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
                        const Text(
                          "15 ingredients",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),

                        // Danh sách các thành phần
                        (ingredients.isEmpty)
                            ? const Text('No ingredients')
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
            const Text(
              "Comments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(
                child: Row(
              children: [
                const Image(image: AssetImage('assets/user_avt.png')),
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
                ? const Text('No comments')
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
