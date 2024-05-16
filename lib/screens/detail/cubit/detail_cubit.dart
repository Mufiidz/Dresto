import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/base_state.dart';
import '../../../models/restaurant.dart';
import '../../../repository/restaurant_repository.dart';

part 'detail_state.dart';
part 'detail_cubit.mapper.dart';

class DetailCubit extends Cubit<DetailState> {
  final RestaurantRepository _restaurantRepository;

  DetailCubit(this._restaurantRepository) : super(const DetailState());

  void init(Restaurant restaurant) async {
    emit(state.copyWith(statusState: StatusState.loading));
    final resultRestaurant =
        await _restaurantRepository.getRestaurant(restaurant.id);
    final recomendationsResult = await _restaurantRepository.getRecomendations(
        restaurant.id, restaurant.rating);

    var newState = resultRestaurant.when(
      result: (data) => state.copyWith(
        statusState: StatusState.success,
        restaurant: data,
      ),
      error: (message) => state.copyWith(
        statusState: StatusState.failure,
        errorMessage: message,
      ),
    );
    newState = recomendationsResult.when(
      result: (data) {
        return newState.copyWith(
          statusState: StatusState.success,
          recomendations: data,
        );
      },
      error: (message) => newState.copyWith(
        statusState: StatusState.failure,
        errorMessage: message,
      ),
    );
    emit(newState);
  }
}
