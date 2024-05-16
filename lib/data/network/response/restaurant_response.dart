import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/restaurant.dart';

part 'restaurant_response.mapper.dart';

@MappableClass()
class RestaurantResponse with RestaurantResponseMappable {
  Restaurant restaurant;

  RestaurantResponse({this.restaurant = const Restaurant()});

  factory RestaurantResponse.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return RestaurantResponseMapper.fromMap(json);
    }
    if (json is String) return RestaurantResponseMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
