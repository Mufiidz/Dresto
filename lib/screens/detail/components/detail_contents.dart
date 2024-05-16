import 'package:flutter/material.dart';

import '../../../components/app_list.dart';
import '../../../models/content.dart';
import '../../../models/restaurant.dart';
import '../../../res/app_textstyle.dart';

class DetailContents extends StatelessWidget {
  final Restaurant restaurant;
  const DetailContents({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return AppList(
      _contents,
      isSeparated: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      scrollPhysics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, data, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                data.title,
                style: AppTextStyle.medium.bold,
              ),
            ),
            Text(
              data.content,
              style: AppTextStyle.normal,
              textAlign: TextAlign.justify,
            )
          ],
        );
      },
      separatorBuilder: (context, item, index) => const SizedBox(height: 8),
    );
  }

  List<Content> get _contents => [
        Content(
            title: "Address",
            content: "${restaurant.address}, ${restaurant.city}."),
        Content(
            title: "Rating",
            content:
                "${restaurant.name} mendapatkan rating ${restaurant.rating}."),
        Content(title: "Foods Menu", content: restaurant.foodsString),
        Content(title: "Drinks Menu", content: restaurant.drinksString),
        Content(
            title: "About ${restaurant.name}", content: restaurant.description),
      ];
}
