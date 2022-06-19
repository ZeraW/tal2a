import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main/main_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static final routes = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
          name: 'main',
          path: '/',
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const MainView()),
          routes: []),

    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const E404(),
    ),
  );
}



class E404 extends StatelessWidget {
  const E404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404'),
      ),
    );
  }
}