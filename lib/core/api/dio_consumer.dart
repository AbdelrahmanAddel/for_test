import 'package:dio/dio.dart';
import 'package:for_test/core/api/api_consumer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer extends ApiConsumer {
  Dio dio = DioI.dio;
  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: query);
      return response.data;
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  void _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(error.message ?? 'Connection timeout');
      case DioExceptionType.sendTimeout:
        throw ServerException(error.message ?? 'Send timeout');
      case DioExceptionType.receiveTimeout:
        throw ServerException(error.message ?? 'Receive timeout');
      case DioExceptionType.badCertificate:
        throw ServerException(error.message ?? 'Bad certificate');
      case DioExceptionType.badResponse:
        _handleBadRequestException(error);
      case DioExceptionType.cancel:
        throw ServerException(error.message ?? 'Cancel');
      case DioExceptionType.connectionError:
        throw ServerException(error.message ?? 'Connection error');
      case DioExceptionType.unknown:
        throw ServerException(error.message ?? 'Unknown error');
    }
  }

  void _handleBadRequestException(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        throw ServerException(error.message ?? 'Bad request');
    }
  }
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class DioI {
  DioI._();
  static final dio = Dio();
  static final instance = dio;

  addDioInterceptor() {
    return dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  Dio get() => dio;
}
