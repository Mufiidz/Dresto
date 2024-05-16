import 'package:flutter/material.dart';

import '../../models/customer_review.dart';
import '../../res/app_textstyle.dart';

class ItemReview extends StatelessWidget {
  final CustomerReview review;
  const ItemReview({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          review.name,
          style: AppTextStyle.bold,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(review.review),
        ),
        Text(
          review.date,
          style: AppTextStyle.light,
        ),
      ],
    );
  }
}
