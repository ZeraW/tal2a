import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:seo_renderer/seo_renderer.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';


class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
  MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      debug: false, // you can set true to enable robot mode
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        routeInformationParser: RouteGenerator.routes.routeInformationParser,
        routerDelegate: RouteGenerator.routes.routerDelegate,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}