import 'package:flutter/material.dart';
import 'package:for_test/core/common/theme/app_light_theme.dart';

import 'package:for_test/core/util/routes/app_router.dart';
import 'package:for_test/core/util/routes/router_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appLightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: RouterString.profileView,
    );
  }
}
