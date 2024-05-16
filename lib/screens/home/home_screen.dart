import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_list.dart';
import '../../di/injection.dart';
import '../../repository/restaurant_repository.dart';
import '../../utils/export_utils.dart';
import '../detail/detail_screen.dart';
import 'cubit/home_cubit.dart';
import 'item_restaurant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit =
        getIt.registerSingleton(HomeCubit(getIt<RestaurantRepository>()));
    _homeCubit.getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D\'Resto'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: _homeCubit,
        listener: (context, state) {
          if (state.isError) {
            context.snackbar.showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state.restaurants.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return AppList(state.restaurants,
              scrollPhysics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, restaurant, index) {
            return ItemRestaurant(
              restaurant: restaurant,
              onClick: (restaurant) =>
                  AppRoute.to(DetailScreen(restaurant: restaurant)),
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _homeCubit.close();
    getIt.unregister<HomeCubit>();
    super.dispose();
  }
}
