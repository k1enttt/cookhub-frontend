import 'package:cookhub_frontend/app/data/widgets/top_navigator.dart';
import 'package:cookhub_frontend/app/global_widgets/skeleton.dart';
import 'package:flutter/material.dart';

class SkeletonRecipesScreen extends StatelessWidget {
  const SkeletonRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            // Hình ảnh nền
            const Stack(children: [
              Skeleton(
                height: 248,
                width: 393,
              ),
              TopNavigator(),
            ]),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Tựa đề
                  const Skeleton(
                    width: 200,
                    height: 31,
                  ),
                  const SizedBox(height: 12),

                  // Thời gian nấu | Độ khó | Đánh giá
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Skeleton(
                          width: 60,
                          height: 16,
                        ),
                        SizedBox(width: 10),
                        Skeleton(
                          width: 60,
                          height: 16,
                        ),
                        SizedBox(width: 10),
                        Skeleton(
                          width: 100,
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 21),

                  // Tags
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Skeleton(
                          width: 130,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Skeleton(
                          width: 130,
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tác giả
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              CircleSkeleton(
                                size: 40,
                              ),
                              SizedBox(width: 12),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Skeleton(
                                      width: 150,
                                      height: 18,
                                    ),
                                    SizedBox(height: 6),
                                    Skeleton(
                                      width: 80,
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Skeleton(
                          width: 70,
                          height: 32,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Mô tả
                  const Skeleton(
                    height: 32,
                    width: 353,
                  ),
                  const SizedBox(height: 26),

                  // Tags
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Skeleton(
                          width: 150,
                          height: 40,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Skeleton(
                          width: 150,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  //Step details
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return const Skeleton(
                            height: 96,
                            width: 350,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
