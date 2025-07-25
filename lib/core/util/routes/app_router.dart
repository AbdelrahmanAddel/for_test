import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_test/core/util/routes/router_string.dart';
import 'package:for_test/features/Sample/presentation/cubit/news_cubit.dart';
import 'package:for_test/features/Sample/presentation/pages/home_page.dart';
import 'package:for_test/features/Sample/presentation/pages/profile_view.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterString.homeView:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouterString.profileView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => NewsCubit(),
                child: const ProfileView(),
              ),
        );

      default:
        return null;
    }
  }
}
