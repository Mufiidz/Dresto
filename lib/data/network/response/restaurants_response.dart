import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/restaurant.dart';

part 'restaurants_response.mapper.dart';

@MappableClass()
class RestaurantsResponse with RestaurantsResponseMappable {
  List<Restaurant> restaurants;

  RestaurantsResponse({this.restaurants = const <Restaurant>[],});

  factory RestaurantsResponse.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return RestaurantsResponseMapper.fromMap(json);
    }
    if (json is String) return RestaurantsResponseMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
