import 'package:dio/dio.dart';
import 'package:for_test/core/api/api_consumer.dart';
import 'package:for_test/core/api/api_strings.dart';
import 'package:for_test/core/errors/server_exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future<dynamic> get({
    required String q,
    required String from,
    required String apiKey,
    required String sortBy,
  }) async {
    try {
      final response = await dio.get(
        ApiStrings.baseUrl,
        queryParameters: {
          ApiStrings.q: q,
          ApiStrings.from: from,
          ApiStrings.apiKey: apiKey,
          ApiStrings.sortBy: sortBy,
        },
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }
}
