import 'package:dartz/dartz.dart';
import 'package:for_test/core/errors/server_exception.dart';
import 'package:for_test/features/Sample/data/models/get_news_model.dart';
import 'package:for_test/features/Sample/domain/repositories/news_repository.dart';

class GetNewsUsecase {
  final NewsRepository newsRepository;

  GetNewsUsecase({required this.newsRepository});
  Future<Either<ServerException, GetNewsModel>> call() async {
    return await newsRepository.getNews();
  }
}
