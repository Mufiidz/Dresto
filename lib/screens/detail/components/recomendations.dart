import 'package:flutter/material.dart';

import '../../../components/app_list.dart';
import '../../../di/injection.dart';
import '../../../models/restaurant.dart';
import '../../../res/app_textstyle.dart';
import '../../../utils/export_utils.dart';
import '../../home/item_restaurant.dart';
import '../cubit/detail_cubit.dart';
import '../detail_screen.dart';

class Recomendations extends StatelessWidget {
  final List<Restaurant> recomendations;
  const Recomendations(this.recomendations, {super.key});

  @override
  Widget build(BuildContext context) {
    if (recomendations.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('Recomendations', style: AppTextStyle.medium.bold),
        ),
        AppList(
          recomendations,
          length: 5,
          shrinkWrap: true,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, item, index) => ItemRestaurant(
              restaurant: item,
              onClick: (restaurant) {
                getIt.unregister<DetailCubit>();
                AppRoute.to(DetailScreen(restaurant: restaurant));
              }),
        )
      ],
    );
  }
}
