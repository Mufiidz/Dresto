part of 'home_cubit.dart';

@MappableClass()
class HomeState extends BaseState with HomeStateMappable {
  final List<Restaurant> restaurants;

  const HomeState(
      {super.errorMessage,
      super.statusState = StatusState.idle,
      this.restaurants = const []});
}
