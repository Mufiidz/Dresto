import 'package:dio/dio.dart';

import '../data/data_result.dart';
import '../data/network/response/error_response.dart';

extension RetrofitExt<T> on Future<T> {
  Future<BaseResult<T>> get awaitResponse async {
    try {
      return DataResult(await this);
    } on DioException catch (dioException) {
      final response = dioException.response;
      final errorType = dioException.type;

      if (errorType == DioExceptionType.connectionTimeout) {
        return ErrorResult("Connection Timeout");
      }

      if (response == null) {
        return ErrorResult(dioException.message ?? "Response is Empty");
      }

      final errorResponse = ErrorResponse.fromJson(response.data);
      return ErrorResult(
          errorResponse.message ?? dioException.message.toString());
    } catch (e) {
      return ErrorResult(e.toString());
    }
  }
}
