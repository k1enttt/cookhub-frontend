import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/core/values/strings.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Data
    // Bước thực hiện
    List<RecipeStep> steps = [
      RecipeStep(
        text:
            'Place the bones and beef chuck in large stockpot and add water to cover. Bring to a boil and boil for 5 minutes. Drain in a colander and thoroughly clean the stockpot. This process removes any impurities/scum and will give you a much cleaner broth.',
      ),
      RecipeStep(
        text:
            'Meanwhile, char your ginger and onions. Use tongs to hold the ginger and onions (one at a time) over an open flame, or place each directly on a gas burner. Turn until they’re lightly blackened and fragrant, about 5 minutes. Rinse away all the blackened skins.',
      ),
      RecipeStep(
        text:
            'Add water (5 quarts/4.75 L, or more/less if you\'ve scaled the recipe up or down) to the stockpot and bring to a boil. Transfer the bones and meat back to the pot, along with the charred/cleaned ginger and onions. Add the scallions, fish sauce and sugar. Reduce the heat to low, and simmer until the beef chuck is tender, about 40 minutes. Skim the surface often to remove any foam and fat.',
        images: ['assets/steps_3_imgs_1.png'],
      ),
      RecipeStep(
        text:
            'Remove one piece of the chuck and transfer to a bowl of ice water to stop the cooking process. Then transfer this piece of beef to a container and refrigerate (you will slice this to serve with your pho later. If you were to leave it in the pot, it would be too dry to eat). Leave the other piece of chuck in the pot to flavor the broth.',
      ),
      RecipeStep(
        text:
            'Remove one piece of the chuck and transfer to a bowl of ice water to stop the cooking process. Then transfer this piece of beef to a container and refrigerate (you will slice this to serve with your pho later. If you were to leave it in the pot, it would be too dry to eat). Leave the other piece of chuck in the pot to flavor the broth.',
        images: const [
          'assets/steps_5_imgs_1.png',
          'assets/steps_5_imgs_2.png',
          'assets/steps_5_imgs_3.png',
        ],
      ),
    ];

    // Thành phần
    List<Ingredient> ingredients = [
      Ingredient(name: 'Beef bones', quantity: '500', unit: 'pounds'),
      Ingredient(name: 'Yellow onions', quantity: '2'),
      Ingredient(name: 'Ginger', quantity: '100', unit: 'g'),
      Ingredient(name: 'Beef chuck', quantity: '5', unit: 'pounds'),
      Ingredient(name: 'Fish sauce', quantity: '1/2', unit: 'cup'),
      Ingredient(name: 'Water', quantity: '5', unit: 'quart'),
      Ingredient(name: 'Rock Sugar', quantity: '21/2', unit: 'ounces'),
      Ingredient(name: 'Cinnamon stick', quantity: '1'),
      Ingredient(name: 'Fennel seeds', quantity: '2', unit: 'teaspoon'),
      Ingredient(name: 'Salt', quantity: '1', unit: 'teaspoon'),
      Ingredient(name: 'Star anise', quantity: '8'),
      Ingredient(name: 'Slided chilli'),
      Ingredient(name: 'Spring onion'),
      Ingredient(name: 'Cilantro'),
    ];

    // Bình luận
    List<Comment> comments = [
      Comment(
        id: 1,
        userName: 'Tien Da',
        userAvt: 'assets/user_avt.png',
        rate: 4,
        body: 'This is a very good recipe. I will try it soon',
      ),
      Comment(
        id: 2,
        userName: 'Tien Da',
        userAvt: 'assets/user_avt.png',
        rate: 2,
        body: 'This is a very good recipe. I will try it soon',
      ),
      Comment(
        id: 3,
        userName: 'Tien Da',
        userAvt: 'assets/user_avt.png',
        rate: 3,
        body: 'This is a very good recipe. I will try it soon',
      ),
      Comment(
        id: 4,
        userName: 'Tien Da',
        userAvt: 'assets/user_avt.png',
        rate: 5,
        body: 'This is a very good recipe. I will try it soon',
      ),
      Comment(
        id: 5,
        userName: 'Tien Da',
        userAvt: 'assets/user_avt.png',
        rate: 1,
        body: 'This is a very good recipe. I will try it soon',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: ListView(
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
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Vietnamese",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Main dish",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
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
                Container(
                  width: 170,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Text(
                    "Steps",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 170,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Các bước chi tiết
          (steps.isEmpty)
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
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Step ${index + 1}: ${steps[index].text}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                          ),

                          // Images
                          (steps[index].images.isEmpty)
                              ? Container()
                              // Có 1 ảnh
                              : (steps[index].images.length == 1)
                                  ? SizedBox(
                                      width: screenWidth,
                                      child: Image(
                                        image:
                                            AssetImage(steps[index].images[0]),
                                      ),
                                    )
                                  :
                                  // Nhiều hơn 1 ảnh
                                  Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      children: List.generate(
                                        steps[index].images.length,
                                        (indexImg) => SizedBox(
                                          width: screenWidth / 4,
                                          child: Image(
                                            image: AssetImage(
                                                steps[index].images[indexImg]),
                                          ),
                                        ),
                                      ),
                                    ),
                        ],
                      );
                    },
                  ),
                ),

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
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                // Danh sách các thành phần
                (ingredients.isEmpty)
                    ? const Text('No ingredients')
                    : (ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  Text(
                                    ingredients[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                              ),
                              Text(
                                '${ingredients[index].quantity} ${ingredients[index].unit}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            // User name + 5 sao
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Avater + Name
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                comments[index].userAvt)),
                                        const SizedBox(width: 10),
                                        Text(
                                          comments[index].userName,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 5 sao
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    child: Row(
                                      children: List.generate(
                                        5,
                                        (indexRate) {
                                          Widget star = const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          );
                                          if (indexRate >
                                              comments[index].rate) {
                                            star = const Icon(
                                              Icons.star,
                                              color: Colors.grey,
                                              size: 16,
                                            );
                                          }

                                          return star;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Comment
                            const Text(
                              'This is a very good recipe. I will try it soon',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                          ],
                        );
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
    );
  }
}
