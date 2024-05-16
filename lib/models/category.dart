import 'package:dart_mappable/dart_mappable.dart';
part 'category.mapper.dart';

@MappableClass()
class Category with CategoryMappable {
  String name;

  Category({
    this.name = "",
  });

  factory Category.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return CategoryMapper.fromMap(json);
    if (json is String) return CategoryMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
