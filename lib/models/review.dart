import 'package:dart_mappable/dart_mappable.dart';

part 'review.mapper.dart';

@MappableClass()
class Review with ReviewMappable {
  final String id;
  final String name;
  final String review;

  const Review({this.id = '', this.name = '', this.review = ''});

  factory Review.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return ReviewMapper.fromMap(json);
    if (json is String) return ReviewMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
