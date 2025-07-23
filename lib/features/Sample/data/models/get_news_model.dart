import 'package:for_test/core/api/api_strings.dart';
import 'package:for_test/features/Sample/data/models/sub_models/articles_sub_model.dart';

class GetNewsModel {
  final List<ArticlesList> ? newsResponse;

  GetNewsModel({required this.newsResponse});
  factory GetNewsModel.fromJson(Map<String, dynamic> jsonResponse) {
   final List<dynamic> articlesJson = jsonResponse[ApiStrings.articles];
  final List<ArticlesList> articles = articlesJson
      .map((article) => ArticlesList.fromJson(article))
      .toList();
    return GetNewsModel(newsResponse: articles);
  }
}
