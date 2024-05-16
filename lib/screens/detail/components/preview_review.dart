import 'package:flutter/material.dart';

import '../../../models/customer_review.dart';
import '../../../res/app_textstyle.dart';
import '../../../utils/export_utils.dart';
import '../../review/item_review.dart';
import '../../review/review_screen.dart';

class PreviewReview extends StatelessWidget {
  final String title;
  final List<CustomerReview> reviews;
  const PreviewReview({super.key, required this.reviews, required this.title});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            'Customer Review',
            style: AppTextStyle.medium.bold,
          ),
        ),
        InkWell(
          onTap: () =>
              AppRoute.to(ReviewScreen(title: title, reviews: reviews)),
          child: SizedBox(
            width: context.mediaSize.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: ItemReview(review: reviews.first),
            ),
          ),
        ),
        reviews.length > 1
            ? Center(
                child: TextButton(
                    onPressed: () => AppRoute.to(
                        ReviewScreen(title: title, reviews: reviews)),
                    child: const Text('See More')),
              )
            : Container()
      ]),
    );
  }
}
