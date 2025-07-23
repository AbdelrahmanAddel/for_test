import 'package:dartz/dartz.dart';
import 'package:for_test/core/errors/server_exception.dart';
import 'package:for_test/features/Sample/data/models/get_news_model.dart';

abstract class NewsRepository {
  Future<Either<ServerException, GetNewsModel>> getNews();
}
