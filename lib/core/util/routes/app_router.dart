import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_test/core/util/routes/router_string.dart';
import 'package:for_test/features/Sample/presentation/cubit/news_cubit.dart';
import 'package:for_test/features/Sample/presentation/pages/home_page.dart';
import 'package:for_test/features/Sample/presentation/pages/profile_view.dart';
import 'package:dio/dio.dart';
import 'package:for_test/core/api/dio_consumer.dart';
import 'package:for_test/features/Sample/data/datasources/get_news_remote_data_source.dart';
import 'package:for_test/features/Sample/data/repositories/news_repository_impl.dart';
import 'package:for_test/features/Sample/domain/usecases/get_news_usecase.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterString.homeView:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouterString.profileView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => NewsCubit(
                      GetNewsUsecase(
                        newsRepository: NewsRepositoryImpl(
                          getNewsRemoteDataSource: GetNewsRemoteDataSource(
                            apiConsumer: DioConsumer(dio: Dio()),
                          ),
                        ),
                      ),
                    )..getNews(),
                child: const ProfileView(),
              ),
        );

      default:
        return null;
    }
  }
}
