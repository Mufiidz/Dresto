import 'package:dart_mappable/dart_mappable.dart';

import 'category.dart';

part 'menus.mapper.dart';

@MappableClass()
class Menus with MenusMappable {
  final List<Category> foods;
  final List<Category> drinks;

  const Menus({
    this.foods = const [],
    this.drinks = const [],
  });

  factory Menus.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return MenusMapper.fromMap(json);
    if (json is String) return MenusMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
