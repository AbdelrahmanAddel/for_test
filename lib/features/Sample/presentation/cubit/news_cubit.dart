import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:for_test/features/Sample/domain/usecases/get_news_usecase.dart';
import 'package:for_test/features/Sample/presentation/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getNewsUsecase) : super(NewsInitial());
  final GetNewsUsecase _getNewsUsecase;
  Future<void> getNews() async {
    print('Done');
    emit(NewsLoading());
    final response = await _getNewsUsecase.call();
    response.fold(
      (failure) => debugPrint('Error =>>؟؟؟/>>> ${failure.message}'),
      (success) {
        for (var i = 0; i < success.newsResponse!.length; i++) {
          print(success.newsResponse![i].title);
          print('///////////////////////');
          print(success.newsResponse![i].description);
          print('///////////////////////');
        }
      },
    );
  }
}
