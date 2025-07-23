import 'package:for_test/core/api/api_consumer.dart';
import 'package:for_test/features/Sample/data/models/get_news_model.dart';

class GetNewsRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetNewsRemoteDataSource({required this.apiConsumer});
  Future<GetNewsModel> getNews() async {
    final response = await apiConsumer.get(
      q: 'q',
      from: '2025-06-22',
      apiKey: '0a4dd8b238a64126b1df3f7cfa97d45f',
      sortBy: 'publishedAt',
    );
    return GetNewsModel.fromJson(response);
  }
}
