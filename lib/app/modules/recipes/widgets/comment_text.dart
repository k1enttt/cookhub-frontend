import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:flutter/material.dart';

class CommentText extends StatelessWidget {
  const CommentText({super.key, required this.comments, required this.index});
  final List<Comment> comments;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User name + 5 sao
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Avater + Name
              SizedBox(
                child: Row(
                  children: [
                    Image(image: AssetImage(comments[index].userAvt)),
                    const SizedBox(width: 10),
                    Text(
                      comments[index].userName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                      if (indexRate > comments[index].rate) {
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
