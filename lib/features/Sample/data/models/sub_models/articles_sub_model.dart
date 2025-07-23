import 'package:for_test/core/api/api_strings.dart';
import 'package:for_test/features/Sample/data/models/sub_models/source_sub_model.dart';

class ArticlesList {
  final SourceModel? source;
  final String ?author;
  final String ?title;
  final String ?description;
  final String ?url;
  final String ?urlToImage;
  final String ?publishedAt;
  final String ?content;

  ArticlesList({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory ArticlesList.fromJson(Map<String, dynamic> jsonResponse) {
    return ArticlesList(
      source: SourceModel.fromJson(jsonResponse[ApiStrings.source]),
      author: jsonResponse[ApiStrings.author],
      title: jsonResponse[ApiStrings.title],
      description: jsonResponse[ApiStrings.description],
      url: jsonResponse[ApiStrings.url],
      urlToImage: jsonResponse[ApiStrings.urlToImage],
      publishedAt: jsonResponse[ApiStrings.publishedAt],
      content: jsonResponse[ApiStrings.content],
    );
  }
}
