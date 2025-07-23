import 'package:dartz/dartz.dart';
import 'package:for_test/core/errors/server_exception.dart';
import 'package:for_test/features/Sample/data/datasources/get_news_remote_data_source.dart';
import 'package:for_test/features/Sample/data/models/get_news_model.dart';
import 'package:for_test/features/Sample/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  GetNewsRemoteDataSource getNewsRemoteDataSource;
  NewsRepositoryImpl({required this.getNewsRemoteDataSource});
  Future<Either<ServerException, GetNewsModel>> getNews() async {
    try {
      final response = await getNewsRemoteDataSource.getNews();
      return Right(response);
    } on ServerException catch (error) {
      return Left(error);
    }
  }
}
