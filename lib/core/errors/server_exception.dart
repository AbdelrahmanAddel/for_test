import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

void handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(message: error.message ?? 'Connection timeout');
    case DioExceptionType.sendTimeout:
      throw ServerException(message: error.message ?? '');
    case DioExceptionType.receiveTimeout:
      throw ServerException(message: error.message ?? 'Connection timeout');
    case DioExceptionType.badCertificate:
      throw ServerException(message: error.message ?? 'Connection timeout');
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 401:
          throw ServerException(message: 'UnAuthorized');
        case 400:
          throw ServerException(message: 'Bad request');
        case 404:
          throw ServerException(message: 'Not found');
        case 429:
          throw ServerException(message: 'Too many requests');
        case 500:
          throw ServerException(message: 'Internal server error');
        default:
          throw ServerException(message: 'Something went wrong');
      }
    case DioExceptionType.cancel:
      throw ServerException(message: error.message ?? 'Connection timeout');
    case DioExceptionType.connectionError:
      throw ServerException(message: error.message ?? 'Connection timeout');
    case DioExceptionType.unknown:
      throw ServerException(message: error.message ?? 'Connection timeout');
  }
}
