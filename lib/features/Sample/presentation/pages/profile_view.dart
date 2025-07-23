import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_test/core/util/helper/app_extension.dart';
import 'package:for_test/features/Sample/presentation/cubit/news_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Profile ',
              style: TextStyle(
                fontSize: 40,
                color: context.theme.appTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () async {
                await context.read<NewsCubit>().getNews();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
