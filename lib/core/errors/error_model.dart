import 'package:for_test/core/api/api_strings.dart';

class ErrorModel {
  final String? status;
  final String? code;
  final String? message;

  ErrorModel({required this.status, required this.code, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonResponse) {
    return ErrorModel(
      status: jsonResponse[ApiStrings.status],
      code: jsonResponse[ApiStrings.code],
      message: jsonResponse[ApiStrings.message],
    );
  }
}
