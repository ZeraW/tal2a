import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:tal2a/app/server/admins_api.dart';
import 'package:tal2a/app/server/clients_api.dart';
import 'package:tal2a/app/server/drivers_api.dart';
import 'package:tal2a/presentation/models/models.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'server/city_api.dart';


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
      child: MultiProvider(
        providers: [
          StreamProvider<Location?>.value(value: CityApi().getLiveLocation, initialData: null,),
          StreamProvider<AllClients?>.value(value: ClientApi().getLiveClient, initialData: null,),
          StreamProvider<AllDelivery?>.value(value: DriversApi().getLiveData, initialData: null,),
          StreamProvider<AllAdmins?>.value(value: AdminsApi().getLiveData, initialData: null,),

        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          routeInformationProvider: RouteGenerator.routes.routeInformationProvider,
          routeInformationParser: RouteGenerator.routes.routeInformationParser,
          routerDelegate: RouteGenerator.routes.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}