import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
@injectable
abstract class AppModule {
  @singleton
  Dio dio() {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      contentType: 'application/json; charset=utf-8',
    );
    final dio = Dio(options);

    if (kDebugMode) {
      final dioLogger = PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true);
      dio.interceptors.add(dioLogger);
    }
    return dio;
  }
}
