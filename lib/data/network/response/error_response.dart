import 'package:dart_mappable/dart_mappable.dart';

part 'error_response.mapper.dart';

@MappableClass()
class ErrorResponse with ErrorResponseMappable {
  final String? message;
  const ErrorResponse({this.message});

  factory ErrorResponse.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return ErrorResponseMapper.fromMap(json);
    if (json is String) return ErrorResponseMapper.fromJson(json);
    return throw Exception(
        'The argument type \'${json.runtimeType}\' can\'t be assigned');
  }
}
