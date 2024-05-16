import 'package:injectable/injectable.dart';

import '../data/data_result.dart';
import '../data/network/api_services.dart';
import '../models/customer_review.dart';
import '../models/restaurant.dart';
import '../models/review.dart';
import '../utils/retrofit_ext.dart';

abstract class RestaurantRepository {
  Future<BaseResult<List<Restaurant>>> getRestaurants();
  Future<BaseResult<Restaurant>> getRestaurant(String id);
  Future<BaseResult<List<Restaurant>>> searchRestaurants(String query);
  Future<BaseResult<List<CustomerReview>>> postReview(Review review);
  Future<BaseResult<List<Restaurant>>> getRecomendations(
      String id, double rating);
}

@Injectable(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final ApiServices _apiServices;

  RestaurantRepositoryImpl(this._apiServices);

  @override
  Future<BaseResult<Restaurant>> getRestaurant(String id) async {
    final response = await _apiServices.getRestaurant(id).awaitResponse;
    return response.when(
        result: (data) => DataResult(data.restaurant),
        error: (message) => ErrorResult(message));
  }

  @override
  Future<BaseResult<List<Restaurant>>> getRestaurants() async {
    final response = await _apiServices.getRestaurants().awaitResponse;
    return response.when(
        result: (data) => DataResult(data.restaurants),
        error: (message) => ErrorResult(message));
  }

  @override
  Future<BaseResult<List<CustomerReview>>> postReview(Review review) async {
    final response = await _apiServices.postReview(review).awaitResponse;
    return response.when(
        result: (data) => DataResult(data.customerReviews),
        error: (message) => ErrorResult(message));
  }

  @override
  Future<BaseResult<List<Restaurant>>> searchRestaurants(String query) async {
    final response = await _apiServices.searchRestaurants(query).awaitResponse;
    return response.when(
        result: (data) => DataResult(data.restaurants),
        error: (message) => ErrorResult(message));
  }

  @override
  Future<BaseResult<List<Restaurant>>> getRecomendations(
      String id, double rating) async {
    final response = await _apiServices.getRestaurants().awaitResponse;
    var recomendations = <Restaurant>[];
    return response.when(
        result: (data) {
          for (var restaurant in data.restaurants) {
            if (restaurant.id != id && restaurant.rating >= rating) {
              recomendations.add(restaurant);
            }
          }
          recomendations.shuffle();
          return DataResult(recomendations);
        },
        error: (message) => ErrorResult(message));
  }
}
