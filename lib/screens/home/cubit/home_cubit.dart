import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/base_state.dart';
import '../../../models/restaurant.dart';
import '../../../repository/restaurant_repository.dart';

part 'home_state.dart';
part 'home_cubit.mapper.dart';

class HomeCubit extends Cubit<HomeState> {
  final RestaurantRepository _restaurantRepository;

  HomeCubit(this._restaurantRepository) : super(const HomeState());

  void getRestaurants() async {
    emit(state.copyWith(statusState: StatusState.loading));
    final result = await _restaurantRepository.getRestaurants();
    final newState = result.when(
      result: (data) => state.copyWith(
        statusState: StatusState.success,
        restaurants: data,
      ),
      error: (message) => state.copyWith(
        statusState: StatusState.failure,
        errorMessage: message,
      ),
    );
    emit(newState);
  }
}
