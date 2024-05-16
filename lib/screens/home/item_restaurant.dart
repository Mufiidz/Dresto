import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../res/app_textstyle.dart';
import '../../utils/export_utils.dart';

typedef OnClick = void Function(Restaurant restaurant);

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  final OnClick onClick;
  const ItemRestaurant(
      {super.key, required this.restaurant, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 8,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: InkWell(
            onTap: () => onClick(restaurant),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      restaurant.image,
                      height: 150,
                      width: context.mediaSize.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(8))),
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            restaurant.rating.toString(),
                            style: AppTextStyle.normal
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: SizedBox(
                    width: context.mediaSize.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: AppTextStyle.medium,
                        ),
                        Text(
                          restaurant.city,
                          style: AppTextStyle.normal,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
