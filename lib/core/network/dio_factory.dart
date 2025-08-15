import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
      _addDioPrettyLogger();

      _dio?.options.baseUrl = "https://api.escuelajs.co/graphql";
      _dio?.options.receiveTimeout = Duration(seconds: 30);
      _dio?.options.connectTimeout = Duration(seconds: 30);
      _dio?.options.sendTimeout = Duration(seconds: 30);
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addDioPrettyLogger() {
    _dio?.interceptors.add(
      PrettyDioLogger(

        requestBody: true,

        responseBody: true,

      ),
    );
  }
}
