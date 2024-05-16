import 'package:flutter/material.dart';

import '../../components/app_list.dart';
import '../../models/customer_review.dart';
import 'item_review.dart';

class ReviewScreen extends StatelessWidget {
  final String title;
  final List<CustomerReview> reviews;
  const ReviewScreen({super.key, required this.title, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title reviews"),
      ),
      body: AppList(
        reviews,
        isSeparated: true,
        padding: const EdgeInsets.symmetric(vertical: 8),
        scrollPhysics: const BouncingScrollPhysics(),
        itemBuilder: (context, item, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ItemReview(review: item),
        ),
      ),
    );
  }
}
