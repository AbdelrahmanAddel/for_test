import 'package:for_test/core/api/api_strings.dart';

class SourceModel {
  final String? id;
  final String? name;

  SourceModel({required this.id, required this.name});
  factory SourceModel.fromJson(Map<String, dynamic> jsonResponse) {
    return SourceModel(
      id: jsonResponse[ApiStrings.id],
      name: jsonResponse[ApiStrings.name],
    );
  }
}
