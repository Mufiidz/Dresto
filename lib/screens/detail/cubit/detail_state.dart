part of 'detail_cubit.dart';

@MappableClass()
class DetailState extends BaseState with DetailStateMappable {
  final Restaurant restaurant;
  final List<Restaurant> recomendations;

  const DetailState(
      {this.restaurant = const Restaurant(),
      this.recomendations = const [],
      super.statusState,
      super.errorMessage});
}
