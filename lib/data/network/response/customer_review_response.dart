import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/customer_review.dart';

part 'customer_review_response.mapper.dart';

@MappableClass()
class CustomerReviewResponse with CustomerReviewResponseMappable {
  List<CustomerReview> customerReviews;

  CustomerReviewResponse({this.customerReviews = const <CustomerReview>[]});

  factory CustomerReviewResponse.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return CustomerReviewResponseMapper.fromMap(json);
    }
    if (json is String) return CustomerReviewResponseMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}