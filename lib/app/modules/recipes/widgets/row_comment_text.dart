import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:cookhub_frontend/core/values/text_style.dart';
import 'package:flutter/material.dart';

class CommentText extends StatelessWidget {
  const CommentText({super.key, required this.comments, required this.index});
  final List<Comment> comments;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        Image(image: AssetImage(comments[index].userAvt)),

        const SizedBox(width: 10),

        // Tên + 5 sao + Nội dung
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tên
                    Text(
                      comments[index].userName,
                      style: CustomTextStyles.mediumStyle,
                    ),
                    // 5 sao
                    SizedBox(
                      child: Row(
                        children: List.generate(
                          5,
                          (indexRate) {
                            Widget star = const Icon(
                              Icons.star_rate_rounded,
                              color: CustomColor.primary,
                              size: 16,
                            );
                            if (indexRate >= comments[index].rate) {
                              star = const Icon(
                                Icons.star_rate_rounded,
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

              // Nội dung
              Text(
                comments[index].body,
                style: CustomTextStyles.normalStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
