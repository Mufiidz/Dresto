import 'package:dart_mappable/dart_mappable.dart';

import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

part 'restaurant.mapper.dart';

@MappableClass()
class Restaurant with RestaurantMappable {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  const Restaurant({
    this.id = '',
    this.name = '',
    this.description = '',
    this.city = '',
    this.address = '',
    this.pictureId = '',
    this.categories = const <Category>[],
    this.menus = const Menus(),
    this.rating = 0,
    this.customerReviews = const <CustomerReview>[],
  });

  String get image =>
      "https://restaurant-api.dicoding.dev/images/medium/$pictureId";

  String get categoriesString =>
      categories.map((category) => category.name).join(', ');

  String get foodsString => menus.foods.map((food) => food.name).join(', ');

  String get drinksString => menus.drinks.map((drink) => drink.name).join(', ');

  factory Restaurant.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return RestaurantMapper.fromMap(json);
    if (json is String) return RestaurantMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
