import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_test/features/Sample/data/datasources/get_news_remote_data_source.dart';

import 'package:for_test/features/Sample/presentation/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final GetNewsRemoteDataSource _getNewsUsecase = GetNewsRemoteDataSource();
  Future<void> getNews() async {
    print('Done');
    emit(NewsLoading());
    final response = await _getNewsUsecase.getData();
    print(response.product[0].title);
  }
}
