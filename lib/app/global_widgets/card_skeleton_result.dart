import 'package:cookhub_frontend/app/global_widgets/skeleton.dart';
import 'package:flutter/material.dart';

class CardSkeletonResult extends StatelessWidget {
  const CardSkeletonResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton(
          height: 80,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                width: 193,
                height: 21,
              ),
              SizedBox(height: 4),
              Skeleton(
                width: 100,
                height: 15,
              ),
              SizedBox(height: 4),
              Skeleton(
                width: 50,
                height: 15,
              ),
              SizedBox(height: 4),
              SizedBox(
                child: Row(children: [
                  CircleSkeleton(
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Skeleton(
                    width: 130,
                    height: 16,
                  ),
                ]),
              )
            ],
          ),
        ),
        CircleSkeleton(size: 16),
      ],
    );
  }
}
