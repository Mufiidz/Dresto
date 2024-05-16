import 'package:dart_mappable/dart_mappable.dart';

part 'customer_review.mapper.dart';

@MappableClass()
class CustomerReview with CustomerReviewMappable {
  String name;
  String review;
  String date;

  CustomerReview({
    this.name = "",
    this.review = "",
    this.date = "",
  });

  factory CustomerReview.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return CustomerReviewMapper.fromMap(json);
    if (json is String) return CustomerReviewMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
