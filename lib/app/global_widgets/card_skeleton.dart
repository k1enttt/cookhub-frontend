import 'package:cookhub_frontend/app/global_widgets/skeleton.dart';
import 'package:flutter/material.dart';

class CardSkeletonHome extends StatelessWidget {
  const CardSkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            height: 168,
            width: 168,
          ),
          SizedBox(
            height: 8,
          ),
          Skeleton(
            width: 168,
            height: 21,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              CircleSkeleton(
                size: 24,
              ),
              SizedBox(
                width: 4,
              ),
              Skeleton(
                width: 103,
                height: 24,
              ),
            ],
          ),
        ]);
  }
}
